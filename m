Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF57C636CC
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15271C4339B; Sat, 18 Feb 2023 18:46:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB2AAC433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB2AAC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id bv9so841335wrb.3
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4AjRHOqbZZiyYnTSt7djBdfodfWVmg7tajh7ls30yc=;
        b=qr28koq+YEUGWDSlA6wlIJfyOcNexjfX6Sh/JWTVoWObBfpfZEjq6noYER8DQREEc/
         BHuSJgmorVHBae7vvAAjvNZdRX4sBxMMGJ6j10nuvwzqmTRwLWCdHokET3cVkQsRUNA/
         uqEpwVsHJ3ZvDKXIHgg+7Xdvw71CnFItjU+sI3HWgUS3X6Q4wNqSajEg5OfCoDLci945
         JcU+frFqgGxtQJxnsSFWrn1IqG+rX2WpL1gZSELmT3rAMrpuxiIzQmcx7neCXtPhnyhs
         SWe+/MScQiF8f9hjcYMwtiyuNQwkuhdzZYrEecicdx7lBG7ZXUNzeNtR1uL3LpQkV2VA
         QqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4AjRHOqbZZiyYnTSt7djBdfodfWVmg7tajh7ls30yc=;
        b=JepUAUUwi2HBcBVhs/Uz0yBlNdefqM2qItUd5YoBhK/t2MPh+Sb5vvfxQpPf50uKlU
         pwgahOFIouLYuJifIt8RWUM5bLvbmwSFRfyeCvlMhg1hajNEramhBctwPhdU2odwT6kt
         CF4FTygsoHnjaMxaxKqvYgnsH5Y9KZ9kChzN0iIqDfI3RINUC8hnSuUJ+8bMKvAStUAy
         +2hpolQCbQA76qBiRCUrae1Wk3yaU53fPUSE2HxBJlYEswuCcsi4+UX3SHciaFf89lfx
         g+kLsTSO3IBv8EBiiJwTMBX6pMogLCe/RzTD583JetP7H3ilci3mPkMexdEQQpjKSH39
         XYCw==
X-Gm-Message-State: AO0yUKVPSfoMqYUODKKdfGAo79AETL9LnM/bjoubjZyiNooxFNQJADsa
	FKHYv6OzYnexAofDLlF1MjFtUsWZ00o=
X-Google-Smtp-Source: AK7set/xKniLYacKloBJlfSMXsq7q3gvj2QdpXQL5VFRy7vvG/U71DMazdUYTOiYRKZFqQRjk7g2EQ==
X-Received: by 2002:adf:fb90:0:b0:2c5:9c7a:866 with SMTP id a16-20020adffb90000000b002c59c7a0866mr1406742wrr.51.1676745983509;
        Sat, 18 Feb 2023 10:46:23 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id w15-20020adfec4f000000b002c54241b4fesm1405235wrn.80.2023.02.18.10.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:22 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 00/15] Misc fixes, sanity checks and xz/zstd compression
Date: Sat, 18 Feb 2023 18:46:06 +0000
Message-Id: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings everyone,

For a while now, the kernel has been accepting compressed firmware - be that xz
or zstd. There is a patch for the former on the ML, yet the latter is still
lacking.

While working through I've noticed a few issues - of various severity - so
decided to fix them all.

Mind you, I'm sending everything as single patch series to gauge feedback. I'm
quite happy to split and rework as per the community's feedback.

In a gist:
 - remove quoted filenames in WHENCE - escape white space as needed
 - remove _nearly_ all duplicate entries in WHENCE && add check
   - NOTE: one entry remains, which I'm not sure how to resolve cleanly
 - check if directory is listed as File - had a mistake like that locally
 - check we have no symlinks and drop symlink workarounds
 - quote deskdir (genuine bug) + few more shellcheck inspired fixes
 - support xz and zstd compressed firmware - no intermediate files, pipe
   directly into destdir


Kind regards
Emil


Emil Velikov (15):
  WHENCE: remove trailing white space
  WHENCE: remove unnecessary filename quotation
  check_whence, WHENCE, copy-firmware: escape filenames with spaces
  WHENCE: remove duplicate File entries
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

 Makefile         |  8 ++++
 WHENCE           | 97 +++++++++++++++++++-----------------------------
 check_whence.py  | 44 +++++++++++++++++++---
 copy-firmware.sh | 71 +++++++++++++++++------------------
 4 files changed, 119 insertions(+), 101 deletions(-)

-- 
2.39.2

