Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1AAC7EE36
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68E69C4339B; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B71BC433EF;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=lEUKziagfS9TQH5uWWD4nJ79NWK0qA8ZxG9IL4sHw/U=;
	h=From:Subject:Date:List-Id:To:Cc:Reply-To:From;
	b=F70Zyq/lLaD9d1e7PaMdNtvhM/+uSwcgubP/jwRbf2egyVq4N9+dOQLqFBO5xuwkl
	 eJb4ryh+GLlChRhYnuLhXzhezQrwfoDGXhYw7bZ4tn3avcoCFfggOZUD2ZE0lg5RdI
	 qOKdk+AzALVc4Ee3XGPcKmLQ7Hey3Bjw8TAj0j5sVEKQdF+MUV48KvcAGqqvPzDySE
	 /I7bIKfKICNktPszkerUUyGppkb22FV3r3ZJkK7chk7pILr78rlj1hb0w7K1ejvkLV
	 Iuja5XtVX1XAyc7a4bJypcehI2p82e2f8oEksU3zW11cqGG5eVQT2TSMSdvFRxRp1m
	 yo/GuIJ/B/N4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37301C7EE2F;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Subject: [PATCH RESEND v2 00/16] Misc fixes, sanity checks and xz/zstd
 compression
Date: Wed, 01 Mar 2023 18:56:14 +0000
Message-Id: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=2014;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=lEUKziagfS9TQH5uWWD4nJ79NWK0qA8ZxG9IL4sHw/U=;
 b=Fp8M1nZeUyO8EZYToKCPcRkJV8gl6jBZw/s7EGQ0cS2HN8GLh1oiHmk4iWtHG64PvbK2cx6ou
 MhXKkLiW/CMDojBBu0/Gw+On+i95w48iwfz1WUfx7Ovd3AvOPJam1pa
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

Hey everyone,

Here's an updated series which fixes some outstanding issues, enhances
the check_whence checks and adds xz/zstd firmware support.

v2:
 - Commend out duplicated MediaTek firmware
 - Tweak list_links_list() after Adam's approach
 - Skip compression of amd ucode

Link to v1: https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGWOP-Pb8oGo1BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/

Josh, others, kindly let me know if you'd prefer a PR or if there is
anything I can do to move this forward. Be that as a whole, or chunks of
it.

Thanks
Emil

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Emil Velikov (16):
      WHENCE: remove trailing white space
      WHENCE: remove unnecessary filename quotation
      check_whence, WHENCE, copy-firmware: escape filenames with spaces
      WHENCE: remove duplicate File entries
      WHENCE: comment out duplicate MediaTek firmware
      check_whence: error on duplicate file entries
      check_whence: error on directory listed as File
      copy-firmware: remove non-applicable file presence test
      check_whence: error if File: is actually a link
      check_whence: error if symlinks are in-tree
      copy-firmware: remove unreachable symlink workarounds
      copy-firmware: quote deskdir to prevent word splitting
      copy-firmware: tweak sed invocation
      copy-firmware: quote the output of dirname
      copy-firmware: silence the last shellcheck warnings
      Makefile, copy-firmware: support xz/zstd compressed firmware

 Makefile         |   8 +++++
 WHENCE           | 107 ++++++++++++++++++++++++-------------------------------
 check_whence.py  |  53 +++++++++++++++++++++++----
 copy-firmware.sh |  76 ++++++++++++++++++++-------------------
 4 files changed, 141 insertions(+), 103 deletions(-)
---
base-commit: 60971a6485ee604c47cc905ff77c583ae001f9df
change-id: 20230301-fixes-and-compression-7247407cab21

Best regards,
-- 
Emil Velikov <emil.l.velikov@gmail.com>

