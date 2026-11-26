components {
  id: "shadow_flyer"
  component: "/game/combat/shadow_flyer.script"
}
embedded_components {
  id: "flyer_skin"
  type: "sprite"
  data: "default_animation: \"\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  ""
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"enemy\"\n"
  "mask: \"ground\"\n"
  "mask: \"player\"\n"
  "mask: \"player_projectile\"\n"
  ""
}
