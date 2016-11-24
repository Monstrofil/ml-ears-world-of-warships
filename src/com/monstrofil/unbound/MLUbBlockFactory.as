package com.monstrofil.unbound
{
   import lesta.unbound.layout.UbBlockFactory;
   import lesta.unbound.expression.IUbExpression;
   import monstrofil.expression.UbExpressionCompiler;
   import lesta.unbound.core.UbCentral;
   
   public class MLUbBlockFactory extends UbBlockFactory
   {
       
      public var expressionCompiler:UbExpressionCompiler;
      
      public function MLUbBlockFactory(param0:UbCentral, arg2:*)
      {
         this.expressionCompiler = new UbExpressionCompiler();
         super(param0, arg2);
      }
      
      override public function parseBindingExpression(arg1:String) : IUbExpression
      {
         return this.expressionCompiler.compile(arg1);
      }
   }
}

/*python file_divide.py config/__background.xml bin/$(ProjectName)/ root_block

python prebuild.py*/