Return-Path: <SRS0=5TED=Z6=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6096DC07E9D
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Sep 2022 22:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23606C433D7; Tue, 27 Sep 2022 22:34:29 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0598EC433D6
	for <linux-firmware@kernel.org>; Tue, 27 Sep 2022 22:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0598EC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=25v4d3njgQmFUNX8yL5/Bp3Safnvcd3pkxov2ZeF2z4=; b=c+g4nfmVPO2gW0ZRnVvFeNWug4
	PR3X+hM/a4j4afc7XuJ7KJKQDkwrrQX0LOoWfe9m3edLmGlAfvbHPK4Gm/SxlqB5x6GJsr0CPlXuQ
	dXbEjnYrJ5sen/wB5r8aUazZ/6Udazb2kx6gvfudDGnzid5tjdqKAUYnxjw2eL+VqRaT/OBz5foh9
	4O4NdmR7ohvJqNtenQtE/K5FPSyx1UGbViYVC6Pv8lksoWupBabCkpw1haa6YWEo3VlTVFqxNvRYA
	Y1BY3zDWiMuE625YnW0XCHE3LtqGX3Kq6N7L/rlKWIkWj7m2UO2TFR1npx0eRb3Ejp6VggadQueTq
	gkPA5TRQ==;
Received: from p200300ccff151c001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff15:1c00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1odJ9e-0007pZ-Fu; Wed, 28 Sep 2022 00:34:18 +0200
Date: Wed, 28 Sep 2022 00:34:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-wireless@vger.kernel.org
Subject: brcmfmac nvram files best practices
Message-ID: <20220928003417.0bc3e5f1@aktux>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am working on mainlining stuff for several ebook readers (esp.
kobo/tolino ones). I often find a CyberTan WC121 (BCM43362) SDIO WiFi
chip there.
That one requires a nvram file. It can be found in the vendor system
(often an ancient 3.0.35 kernel with bcmdhd driver)

So now, it would be nice to have it installed via package management.
A source for that missing file is (besides of sdcard backups of the original
system):
https://download.pageplace.de/ereader/15.3.2/OS44/update.zip 
(linked from here: https://mytolino.de/software-updates-tolino-ereader/) 
path system/lib/firmware/wc121/nvram.txt needs to be present at
/lib/firmware/brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt

The only problem is that I do not see a distribution license there. So
I am hesitating to just submit that one to the linux-firmware.git

Are there any best practices to deal with that situation? find any
source which also includes a license (and which hopefully allows
distribution)? or is there any way to reverse-engineer that stuff.

How were things done for the nvram.txt files already present in
linux-firmware.git?

Regards,
Andreas Kemnade
