Return-Path: <SRS0=Kbhs=SD=em7952.kwatra.me=bounces+6493901-e9dc-linux-firmware=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAA0C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Jan 2022 07:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB82AC340E3; Wed, 19 Jan 2022 07:06:20 +0000 (UTC)
Received: from xtrwsqzf.outbound-mail.sendgrid.net (xtrwsqzf.outbound-mail.sendgrid.net [167.89.100.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B23CFC004E1
	for <linux-firmware@kernel.org>; Wed, 19 Jan 2022 07:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B23CFC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kwatra.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=em7952.kwatra.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwatra.me;
	h=mime-version:from:subject:to:content-type:content-transfer-encoding;
	s=s1; bh=xmAi0EWW26Zs8J4dlwViVvibJhcsxkp6hsHbcYPUFZA=;
	b=SfQpibqU6t5SxiOdes/HZLN6NnBDCHlQhEOQITcvbUKBTemDJzea0ogMcsmEqvb8wUKN
	ywIxZVRdtd8PiFoN0DS06QKQx5zPEcEv6DgJ4ES/4VeYoNCs7OwdpxvYreXNE85Hw+BpIr
	tIKdbRce/f438xXwHCvhRxEFDsZ/ngexx9X3yK9RMJD/SY1BbaOCl0iJ358Lpcys4OoxMH
	G0Z0+qDeodrRHZS3KbsjaTq4OB7jDOrqieTm+Dxy6sBxcugBlkzMKaaIPZYDVhc30DfhiD
	l/FTWa4c5USWSUpaBD8s0i9MqXD0FVz2qUVg3IDSojo1sXIsjT1/Qi6gjqLRD/0g==
Received: by filterdrecv-7bc86b958d-qrvxl with SMTP id filterdrecv-7bc86b958d-qrvxl-1-61E7B86A-4D
        2022-01-19 07:06:18.673951491 +0000 UTC m=+12041144.037027756
Received: from mail-lf1-f43.google.com (unknown)
	by geopod-ismtpd-3-2 (SG)
	with ESMTP id O91mfOj0QwGtr3cDsvQwHg
	for <linux-firmware@kernel.org>;
	Wed, 19 Jan 2022 07:06:18.346 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x22so5399379lfd.10
        for <linux-firmware@kernel.org>; Tue, 18 Jan 2022 23:06:18 -0800 (PST)
X-Gm-Message-State: AOAM530ogF39CFx1XjZw2VPl7bUdpRm7+xCRC3TTKUbCmJpM213pdVjh
	U2XVc9v9Ap9Krpc+pBKYLkwjs+SbQTHUyxUKZzU=
X-Google-Smtp-Source: ABdhPJwxJQZ1uPY53GmccvDtA293DZ4gH36cfUuv+N8hCCNcdM6MhABF5wprZxDVmuOrJ+kZNyH1aXDoNxhBBnSuD6k=
X-Received: by 2002:a19:c214:: with SMTP id l20mr25007109lfc.321.1642575977326;
 Tue, 18 Jan 2022 23:06:17 -0800 (PST)
MIME-Version: 1.0
From: Kabir Kwatra <kabir@kwatra.me>
Date: Wed, 19 Jan 2022 07:06:18 +0000 (UTC)
X-Gmail-Original-Message-ID: <CAHm2Bk47EqXkwrkue02p86+WtPpAgL0325FanGd5EoBVLrGPmg@mail.gmail.com>
Message-ID: <CAHm2Bk47EqXkwrkue02p86+WtPpAgL0325FanGd5EoBVLrGPmg@mail.gmail.com>
Subject: Trivial WHENCE delisting
X-SG-EID: 
 =?us-ascii?Q?9Agss2mUk5MiAtUFp+WGzTInWLw6YiR4tI1T7d2XjJLS1jVT0DZAQeNNCHBEkM?=
 =?us-ascii?Q?jdD=2F9naBdEtWHeaeCDAxC3EGbwTfKLwjLG4UXUM?=
 =?us-ascii?Q?LbawnJfC0+5t2iNDoBWJsojagqQQwf69mKAHhQc?=
 =?us-ascii?Q?Qp3qW9Ayuo4UsmFHqkd3C=2Fidp2lLYf6=2FD8xJHyN?=
 =?us-ascii?Q?u5nXRRLsGG+XZ9IFu=2FV2QeSwV2NpYKRK2YdRsgl?=
 =?us-ascii?Q?9f87P=2F1JfZzH8mLYTfz6MXhE7xIku7ji7uMOHF?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Entity-ID: +cyaVTnoPVPqVjsec9xrgg==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

The following changes since commit 8d8c6e9d9eb5402295c434603007377487458fef:

  iwlwifi: add new FWs from core66-88 release (2022-01-10 14:37:12 +0200)

are available in the Git repository at:

  git@github.com:Kab1r/linux-firmware.git

for you to fetch changes up to a3c806d02be2aed1dde1064a24a0c204c60c95a3:

  fix: remove nonexistent files from WHENCE (2022-01-18 22:59:46 -0800)

----------------------------------------------------------------
Kabir Kwatra (1):
      fix: remove nonexistent files from WHENCE

 WHENCE | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index 3352a59..bf53aa9 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1273,10 +1273,6 @@ Version: 68.01d30b0c.0
 File: iwlwifi-so-a0-jf-b0-68.ucode
 Version: 68.01d30b0c.0

-File: iwlwifi-s0-a0-gf-a0.pnvm
-
-File: iwlwifi-s0-a0-gf4-a0.pnvm
-
 File: iwlwifi-ty-a0-gf-a0.pnvm

 Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
