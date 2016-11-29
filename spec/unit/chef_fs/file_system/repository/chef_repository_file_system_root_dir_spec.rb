require "spec_helper"
require "chef/chef_fs/file_system/repository/chef_repository_file_system_root_dir"

describe Chef::ChefFS::FileSystem::Repository::ChefRepositoryFileSystemRootDir do
  let(:tmp_path) { Dir.mktmpdir }
  let(:nodes_path) { File.join(tmp_path, "nodes") }
  let(:child_paths) { {"nodes" => [nodes_path] } }
  let(:root_dir) { described_class.new(child_paths) }

  describe "#create_child" do
    context "when creating nodes directory" do
      it "creates the directory" do
        root_dir.create_child("nodes")
        expect(File.exists?(nodes_path)).to be(true)
      end

      it "sets the correct permissions" do
        root_dir.create_child("nodes")
        expect(File.stat(nodes_path).mode.to_s(8)[2..5]).to eq("700")
      end
    end
  end
end
