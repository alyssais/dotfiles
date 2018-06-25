set sendmail = "msmtp -C `printf %q "$XDG_CONFIG_HOME"`/msmtp/msmtprc -a work"
set record = "=[Gmail]/Sent Mail"
set postponed = "=[Gmail]/Drafts"
mailboxes =INBOX =GitHub =Trello
