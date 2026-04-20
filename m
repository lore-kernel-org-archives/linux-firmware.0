Return-Path: <SRS0=8rvL=CT=leemhuis.info=regressions@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BF8F5581D
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Apr 2026 11:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB2FAC19425; Mon, 20 Apr 2026 11:46:50 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C6BFC2BCB6;
	Mon, 20 Apr 2026 11:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C6BFC2BCB6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fzkGg5blfz945r;
	Mon, 20 Apr 2026 13:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776685595;
	bh=1ft6f2QthYwU59dg7eHgY/HW9Fm1KjkNSfGrLXaXo+8=;
	h=Date:From:To:Cc:Subject:From;
	b=cFmKVKbLAlteatYXjfvcHzfW9ErolnOp1av0BE6KwniC19o1FRXHi0Mw76cLiixtI
	 vNxrpR6Yl6UY+FCj0wlp0uPAZUZq1Sw/XBJSZe5cgWHP0Y6z1lqGny+LD//PbyU3Sg
	 rnh9zAO2eJAYFCNXqzrbAkyhJSZG4gNTMBcKtQxcnVZVfS4l4gbYf8rzsNtB8q+tU7
	 MMlUkKeUDL5sy1EMnmVHw9VsTc1Tv8NHIym2w5pqXzCVS/ezN0az8zVgg/FntMKVio
	 3IvjrVryV89vGZ8ABBN1u5crIhU9VNPP4KntY1LiEdNt0zPTvPxj2aMoqCR6pOZH6A
	 j9Djlf5g0U+5A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fzkGg4ty9z7wbd;
	Mon, 20 Apr 2026 13:46:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fzkGf1vyBz8tfJ;
	Mon, 20 Apr 2026 13:46:34 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1BCD9635C4;
	Mon, 20 Apr 2026 13:46:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f689f4a3-e5fa-40d3-9038-8ddc12eec241@leemhuis.info>
Date: Mon, 20 Apr 2026 13:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Dmitry Baryshkov <lumag@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Ravindra <ravindra@intel.com>, pmenzel+bugzilla.kernel.org@molgen.mpg.de
Subject: [regression] AX200 -19 errors on boot after firmware 20260313-1.1
 [forwarding]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177668559249.103413.7737822350288938474@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1BCD9635C4
X-NC-CID: IV2eFh4MCzyB63XKULnz/9QZxyuHtonkXOYW4Qbg7KW5skQfFmM=

Hi Dmitry! It seems linux-firmdware commit 81608d92 (linux-firmware:
Update firmware file for Intel Quasar core) causes a regression; kiran
who submitted that change from Revindra was CCed to the bugzilla ticket
about it about a week ago and Paul mentioned it in a comment to the
merge request about the same time. For details see:

https://bugzilla.kernel.org/show_bug.cgi?id=221339
https://bugzilla.kernel.org/show_bug.cgi?id=221339#c4 [confirmation that
it is 81608d92 that causes this]
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/955
https://bugzilla.suse.com/show_bug.cgi?id=1260599 (older downstream bug)

But nothing happened. So I wonder if that change should just be reverted
to resolve this regression.

Ciao, Thorsten
