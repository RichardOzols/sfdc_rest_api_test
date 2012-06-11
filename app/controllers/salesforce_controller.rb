class SalesforceController < ApplicationController
  def index
  	client = Databasedotcom::Client.new :client_id => "3MVG9yZ.WNe6byQArcjXdoc4_eXWziKpNWp.rZYaUr2_TZoo93HSk29LIPoa4szUz_MJMqjqjM5ybMAVEOXDH", :client_secret => "5602761519983608190"
	client.authenticate :username => "rumdumdum_jq@gmail.com", :password => "testtest1"
	#client.materialize('FeedItem')
	#FeedItem.create("ParentId" => "005A0000001dug9", "Body" => "TEST Materialize from Engine yard", "CreatedById" => "005A0000001dug9")
	
	@data = '{ "body" : { "messageSegments" : [{ "type": "Text","text" : "BAM "}, { "type": "Mention","id" : "005G0000001fPRw"}]}}'

	#@string = 'SELECT Id, Type, CreatedById, CreatedBy.FirstName, CreatedBy.LastName, ParentId, Parent.Name, Body, Title, LinkUrl, ContentData, ContentFileName, (SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges ORDER BY Id DESC), (SELECT Id, CommentBody, CreatedDate, CreatedBy.FirstName, CreatedBy.LastName FROM FeedComments ORDER BY CreatedDate LIMIT 10), (SELECT CreatedBy.FirstName, CreatedBy.LastName FROM FeedLikes) FROM NewsFeed ORDER BY CreatedDate DESC, Id DESC LIMIT 20'
	@string = 'SELECT+id+%28+SELECT+id+from+FeedComments+%28+from+NewsFeed'

	#@test = client.http_delete("/services/data/v24.0/chatter/users/me/following?subjectId=005G0000001fPRw")
	#@test = client.http_delete("/services/data/v24.0/sobjects/EntitySubscription/0E8G0000004ELS3KAO")
	#@test = client.http_delete("/services/data/v24.0/sobjects/FeedLike/0E8G0000004ELS3KAO")
	# @Mention
	@test = client.http_post("/services/data/v23.0/chatter/feeds/record/0F9G0000000PKPz/feed-items", @data)
	#@test = client.http_post("/services/data/v24.0/chatter/feeds/record/0F9G0000000PKPz/feed-items?text=TEST")
	#@test = client.http_get("/services/data/v24.0/chatter/users?q=rich")
	#@test = client.http_get("/services/data/v24.0/chatter/feeds/people/me")
	#@test = client.http_get("/services/data/v24.0/chatter/users/batch/005A0000001dug9IAA")
	#Group Feed
	#@test = client.http_get("/services/data/v24.0/chatter/feeds/record/0F9G0000000PKPz/feed-items?q=bam")
	#Group Feed
	#@test = client.http_post("/services/data/v24.0/chatter/feeds/record/0F9G0000000PKPz/feed-items")
	#Search All
	#@test = client.http_get("/services/data/v24.0/chatter/feed-items?q=#bam")
	#@test = client.http_get("/services/data/v24.0/query/?q=" + URI.escape(@string))
	#@test = client.http_get("/services/data/v24.0/query/?q=SELECT+id+from+NewsFeed")
	#@test = client.http_get("/services/data/v24.0/chatter/groups/0F9G0000000PKPzKAO")
	#@test = client.http_delete("/services/data/v24.0/sobjects/Account/001A000000bGTs1IAG")

  end
end
