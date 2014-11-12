require 'octokit'
require 'rspec'


describe "Github" do
 user= ENV['GITHUB_USERNAME']
 repo= ENV['GITHUB_USERNAME']+'/gitimmersion'
 
 it "should find a gitimmersion repository for the #{repo} [5 points]" do
  Octokit.repository? repo.should be_true
 end

 it "should have at least 3 recent commits in name of #{user} [10 points]" do
  commits = Octokit.commits_since(repo,'2014-01-01')
  commits.count.should be > 3
  commits.each {|c| c.author.login.should eq user}
 end

 it "should have at least 6 recent commits in name of #{user} [10 points]" do
  commits = Octokit.commits_since(repo,'2014-01-01')
  commits.count.should be > 6
  commits.each {|c| c.author.login.should eq user}
 end

 it "should have at least 9 recent commits in name of #{user} [10 points]" do
     
  commits = Octokit.commits_since(repo,'2014-01-01')
  commits.count.should be > 9
  commits.each {|c| c.author.login.should eq user}
 end

 it "should have more than 1 branch at #{repo} [15 points]" do
  Octokit.branches(repo).count.should be > 1
 end 

end
