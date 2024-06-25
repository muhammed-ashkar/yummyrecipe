import 'package:flutter/material.dart';

class CommunityGuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Guidelines'),
        backgroundColor: Colors.orange,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to YummyRecipe!',
                style: TextStyle(
                  fontSize: 24.0, // Increased font size for heading
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 16),
              Text(
                'We’re thrilled to have you join our global community of passionate home chefs and food aficionados. We hope you have as much fun hanging around the kitchen as we do!\n\n'
                'Once you’re registered in the YummyRecipe community, you’ll join millions of fellow food-lovers who post recipes and photos of their food creations. Before you begin, please note that using our website requires that you comply with the Community Guidelines set forth below.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'On YummyRecipe',
                style: TextStyle(
                  fontSize: 24.0, // Increased font size for heading
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 16),
              Text(
                'From the outset, the YummyRecipe motto has always been, “Make everyday cooking fun!”\n\n'
                'Each recipe posted on YummyRecipe has a unique story behind it. They may be a cherished piece of family history passed down through the generations, the secret pride of a professional chef, a product of countless revisions, or simply the result of a serendipitous discovery.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Take Responsibility of Your Content',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'You are able to share your recipes on YummyRecipe with the community, so needless to say, courtesy and politeness go a long way! Please remember that this is a public site, accessible to all users. Do not post threatening, harassing, defamatory, or libelous material. Intentionally making false or misleading statements is also prohibited.\n\n'
                'Our aim is to ensure that our community is inclusive, friendly, and safe for all. YummyRecipe cannot take responsibility for your words and reserves the right to remove harmful comments or terminate the accounts of willfully harmful users at our sole discretion.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Creating a Recipe',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We believe that YummyRecipe’s strength lies in the diversity of cooking techniques and dishes that are represented. The recipes are the result of family memories, trial and error, and wonderful serendipity. So don’t hesitate to post your own spin on a dish, even if you see a similar one already posted!\n\n'
                'We understand that many recipes are based on hints from TV shows, cookbooks, blogs, websites, or recipes by other users. We’d love for these sources of inspiration behind your recipes to be part of the conversation, so go ahead and give thanks and credit where due. Of course, in cases where intentional plagiarism is reasonably suspected, your recipe may be deleted and you may receive a warning from our community managers. While we do not condone public shaming, we take acts of intended plagiarism very seriously.\n\n'
                'It’s also important to remember that photos under copyright protection should not be posted. While recipe photos are not required, please note that if you should decide to include a main recipe photo, it must be your original photo of the completed dish that the recipe provides instructions for. Copied photos are not allowed.\n\n'
                'Further, don’t forget that there are other users around the world who want to recreate your recipes in their home kitchens. So make sure your instructions are clear and easy to follow, and that accompanying photos are helpful in replicating the dish. In that sense, please don’t include non-food photos or non-cooking related photos which are irrelevant to your recipes. After all, we’re all here to help one another make cooking more fun.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Content Ownership',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The content you post using your YummyRecipe account must be your own. This includes photos used in your profile, cooking step photos, or anything else used in your recipe post. If using content that is not your own, you must first ask for permission from the appropriate user or source before posting your recipe.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Stay on Topic',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'It’s our belief that a recipe-sharing site should be centered around cooking! With this goal in mind, we’ve designated some topics as off-limits on YummyRecipe. Off-limit content includes, but is not limited to: advertising or publicizing businesses or external sites in pursuit of monetary gain, personal attacks, and offensive language.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Banned Terms',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'There are specific words we deem inappropriate and unfitting to be used on YummyRecipe. If such terms are used in a recipe or in the comment box, your recipe or comment will not be saved.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Know the Rules',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                'By registering yourself on the YummyRecipe community, you also agree to our Terms of Use. These guidelines may change over time, so please check back on them frequently.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
