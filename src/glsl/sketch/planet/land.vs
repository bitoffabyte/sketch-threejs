attribute vec3 position;
attribute vec2 uv;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

varying vec3 vMPosition;
varying vec2 vUv;
varying float vHeight;

void main(void) {
  // coordinate transformation
  vec4 mPosition = modelMatrix * vec4(position, 1.0);

  vHeight = length(position);
  vMPosition = mPosition.xyz;
  vUv = uv;

  gl_Position = projectionMatrix * viewMatrix * mPosition;
}