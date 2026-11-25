components {
  id: "light_projectile"
  component: "/game/combat/light_projectile.script"
}
embedded_components {
  id: "projectile_skin"
  type: "sprite"
  data: "default_animation: \"\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  ""
}
embedded_components {
  id: "projectile_collision_object"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"player_projectile\"\n"
  "mask: \"enemy\"\n"
  "mask: \"ground\"\n"
  ""
}
