import os
from xml.dom.minidom import parse, parseString
from xml.dom.minidom import Node
BUILD_DIR = "build"
FILE_PATH = os.path.join(BUILD_DIR, "gui/battle_elements.xml")

doc = parse(FILE_PATH)

def remove_blanks(node):
    for x in node.childNodes:
        if x.nodeType == Node.TEXT_NODE:
            if x.nodeValue:
                x.nodeValue = x.nodeValue.strip()
        elif x.nodeType == Node.ELEMENT_NODE:
            remove_blanks(x)
remove_blanks(doc)

for i in doc.documentElement.childNodes:
    if i.nodeName == 'elementList':
        swfref = parseString("""<element name="ml_ears_worldofwarships" 
                                         class="MLEarsApplicationView" 
                                         url="ml-ears-world-of-warships.swf">
                                    <properties hitTest = 'true'/>
                                </element>""").documentElement
        print dir(i)
        i.insertBefore(swfref, i.childNodes[-1])

        for element in [k for k in i.childNodes if k.nodeName == 'element']:
            name = element._attrs.get('name', None).childNodes[0].nodeValue
            if name in ['allyEar', 'enemyEar']:
                print element.nodeName
                element.setAttribute("enabled", 'false')
    
    if i.nodeName == 'controllers':
        controller = parseString('<controller class="MLDatahubController" clips="ml_ears_worldofwarships"/>')
        print 
        
        i.insertBefore(controller.documentElement, i.childNodes[0])
        
with open(FILE_PATH, 'w') as f:
    f.write(doc.toprettyxml())