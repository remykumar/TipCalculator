""" 
Unit test for the tip calulator reference software
"""

import tip_calculator

class TestTip: 
 def test_tip10percent(self): 
     assert 20.0 == tip_calculator.tip10percent(200,10)

 def test_tip15percent(self):
     assert 30.0 == tip_calculator.tip15percent(200,15)

 def test_tip20percent(self):
     assert 40.0 == tip_calculator.tip20percent(200,20)

 def test_tip25percent(self):
     assert 50.0 == tip_calculator.tip25percent(200,25)

 def test_tip30percent(self):
     assert 60.0 == tip_calculator.tip30percent(200,30)
