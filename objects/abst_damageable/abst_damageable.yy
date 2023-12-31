{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "abst_damageable",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":{"name":"abst_destroyable","path":"objects/abst_destroyable/abst_destroyable.yy",},"eventNum":0,"eventType":4,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":{"name":"abst_destroyable_collision","path":"objects/abst_destroyable_collision/abst_destroyable_collision.yy",},"eventNum":0,"eventType":4,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,},
  ],
  "managed": false,
  "overriddenProperties": [],
  "parent": {
    "name": "Attacks",
    "path": "folders/Objects/Game/Skills/Attacks.yy",
  },
  "parentObjectId": {
    "name": "abst_skill",
    "path": "objects/abst_skill/abst_skill.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.0,
  "physicsDensity": 0.0,
  "physicsFriction": 0.0,
  "physicsGroup": 0,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.0,
  "physicsObject": false,
  "physicsRestitution": 0.0,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": false,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_min_damage","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_max_damage","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_damage","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_init_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_object_moveable_init_function","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
  ],
  "solid": false,
  "spriteId": null,
  "spriteMaskId": null,
  "visible": false,
}