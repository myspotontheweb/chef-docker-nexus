require 'spec_helper'

describe docker_image('sonatype/nexus3:latest') do
  it { should exist }
end

describe docker_container('nexus') do
  it { should exist }
  it { should be_running }
end

describe port(8081) do
  it { should be_listening }
end
