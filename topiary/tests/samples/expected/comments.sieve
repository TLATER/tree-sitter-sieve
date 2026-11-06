require "fileinto";
# rule:[Spam]
if header :contains "subject" "spam"
{
  fileinto "Junk"; # trailing comment stays
  # leading comment stays on its own line
  stop;
}
