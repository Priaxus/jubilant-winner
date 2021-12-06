# 9LE
###### tags: `CCSE` `Week 9` `Lecture`


## Base Idea
```python
"""pesudo code/almost python for modeling of scenario"""

class Pod:
    def __init__(self, size=SMALL):
        self.gates = []
        if size == SMALL:
            self.max_gate = 2
        else:
            self.max_gates = 4
        
    def connect_to_gate(self, gate):
        if len(self.gates) == self.max_gates:
            return False
        else:
            self.gates.append(gate)
            return True
   
class Gate:
    def __init__(self, pod1, pod2, direction=HORIZONAL):
        # direction: HORIZINAL, VERTICAL, INSIDE
        # pod 1 is left/top, pod 2 is right/bottom
        self.pods = pods
        self.direction = direction    # useful for GUI but not for logic things
        if pod1.connect_to_gate(self) == False:
            print("failed to add pod to gate")
        if pod2.connect_to_gate(self) == False:
            print("failed to add pod to gate")

class Base:
    pods = [Pod(), Pod(), Pod()]
    gates = [
        Gate(Pod(), Pod()),
        Gate(Pod(), Pod()),
    ]
```

## Scenario Defintion

```yaml
# tests/test_example.yml

# one file per scenario
# a scenario can have many events
name: example scenario
events:
    - test_type: hazard
      time_arrival: 2s
      location: 2

    - test_type: hazard
      time_arrival: 4s
      location: 1

    - test_type: door_failure
      gate: gate_6
      time: 3s
      
    - test-type: door
      gate: <gate-name>
      pld-present: True/False
      pld-valid: True/False
      
    - test-type: multiple-hazard
```