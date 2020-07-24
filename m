Return-Path: <SRS0=S96J=BD=garlic.com=portamex@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315B9C433E0
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Jul 2020 02:27:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CAA320737; Fri, 24 Jul 2020 02:27:20 +0000 (UTC)
X-Greylist: delayed 805 seconds by postgrey-1.34 at mail.kernel.org; Fri, 24 Jul 2020 02:27:19 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D93AF206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garlic.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=portamex@garlic.com
Received: from cuda.garlic.com (cuda.garlic.com [216.139.0.68])
	by mail.kernel.org (Postfix) with ESMTP id D93AF206F4
	for <linux-firmware@kernel.org>; Fri, 24 Jul 2020 02:27:19 +0000 (UTC)
X-ASG-Debug-ID: 1595556833-089ede6c16788100001-DxPAMX
Received: from noc-auth1.garlic.com (hermes.garlic.com [216.139.0.86]) by cuda.garlic.com with ESMTP id 1ukB1iDHcVMGwTh1 for <linux-firmware@kernel.org>; Thu, 23 Jul 2020 19:13:53 -0700 (PDT)
X-Barracuda-Envelope-From: portamex@garlic.com
X-Barracuda-Effective-Source-IP: hermes.garlic.com[216.139.0.86]
X-Barracuda-Apparent-Source-IP: 216.139.0.86
Received: from debian.madgoat.net (unknown [216.57.72.213])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by noc-auth1.garlic.com (Postfix) with ESMTPSA id 379A4D14BA31
	for <linux-firmware@kernel.org>; Thu, 23 Jul 2020 19:13:53 -0700 (PDT)
Date: Thu, 23 Jul 2020 19:13:50 -0700
From: Herb Garcia <portamex@garlic.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Clone i915 firmware
Message-ID: <20200723185536.03e07f48@debian.madgoat.net>
X-ASG-Orig-Subj: Clone i915 firmware
Organization: MadGoat Brewery
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: hermes.garlic.com[216.139.0.86]
X-Barracuda-Start-Time: 1595556833
X-Barracuda-URL: https://cuda.garlic.com:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at garlic.com
X-Barracuda-Scan-Msg-Size: 205
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=3.0 KILL_LEVEL=6.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.83416
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hello,

I'm trying to clone some firmware to my local pc. Do I need to log in
or something? I'm new to using git. I need some of the files from i915
directory. Any help is appreciated.

Herb Garcia
