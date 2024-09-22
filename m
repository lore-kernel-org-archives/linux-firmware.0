Return-Path: <SRS0=Ialu=QU=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B2CF9C6D
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 21:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C769C4CEC4; Sun, 22 Sep 2024 21:01:24 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ABD4C4CEC3
	for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 21:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ABD4C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7529203ddso44188221fa.0
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 14:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727038881; x=1727643681; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0hKSkI7v6TTa+iCef3AuktKGKa2OutZKAtbEasj5Wo=;
        b=AEOWw/3AY4Qr7NfirIDmawt3w/IRs/tkF7/lnCMeDpwVuQJJvhePkCmee6vs1FbqMk
         d6m5wIj4XtI9ZTQ29JIw9qahUPbTZi52OSjOpsV1PTftlfdGIwbR6Zc+DlZf2AS7zF+l
         YsBOWYq+StIvzri2CHBpuPvRds9KWhCjLHdM2xxsv/VedWMc+ZKIO3DoJ6uIdrJGtjaC
         C2OyYZ6Xw3ay7/DwUR1+Q2698UkDLuyVZbxQ8y5bRcEzX082LtdtIiXBLTV3rKRFFeXg
         2+iKdNCSE0puPZufg5KQptqhnZbRjuKZEZl1aI3091FOHw3Lm9EeZHTSkZyrQgniazya
         M7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727038881; x=1727643681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0hKSkI7v6TTa+iCef3AuktKGKa2OutZKAtbEasj5Wo=;
        b=ltoomN/4q0Bxuo/PIAtUaElCGRLIYvOlR8qHaFRA3Fys3R25fqZmUxhzQiWpttIzl1
         gl8gPW3UmfkqJI8+cQ7c12iSxX5vNqGkqgYK1jKmfbBLSBFUe24U046SKEqBCEe4aPAn
         wJoSD8ZQxQt7UFqGe0b5/mzXbXncrjiE6qsrwOw8zLJ1ZAsNoVqyGTmciU8beT/1axzb
         h1ROJwUn2RnFrlG5OzoRIM7G0OcoHkjxra4sx/zXYAuwuyl269zFYTcOqx91yOdCzftS
         wUTA0DDO33hIU/P++79YdsVRWH8hpCUEvmLxBKiQZqq6bgElvbpE18P41ZKHwudKche4
         7ZBg==
X-Gm-Message-State: AOJu0Yy6kQyLXuaG3tWz8HWZNXhtnGbg3U8feTGxYYvTq2aI13uDD1zR
	joXIrju4kB14ZDaCTmBle1LvL3WOYyK3H8joTljo6UafKvAVn+fHa/A3bjXv7KF8ZPI2Bxew+ty
	9bZ+72485jNow2Ff3tjespJFkUc660A==
X-Google-Smtp-Source: AGHT+IEEePS4bxMuROZeXHPzzaJJ1/YaNcIKaj78cZH4P37T51w2QDYx3PcJEuEukypqYVeyehoUrlEDCrd0VEvrDa4=
X-Received: by 2002:a05:651c:2213:b0:2f7:7e07:770f with SMTP id
 38308e7fff4ca-2f7c3d09951mr47690361fa.3.1727038881155; Sun, 22 Sep 2024
 14:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 22 Sep 2024 22:01:09 +0100
Message-ID: <CACvgo53s2Rt1eWog5AdNF-LsXyB3pqoViw8yofz2n8RXqCY49w@mail.gmail.com>
Subject: Re: [PATCH 00/16] Range of copy-firmware/check_whence fixes
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Juerg Haefliger <juerg.haefliger@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Sept 2024 at 21:17, Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> Hello all,
>
> With the latest python 3.12 check_whence.py started throwing some
> warnings. The more I looked around, the more loose ends and bugs reared
> their (ugly) heads.
>
> In this series:
>  - check_whence.py: sort the filenames, use consistent variable names
>  - check_whence.py: fix links-to-links and band them
>  - editorconfig: add the config and fix the yaml+sh indentation
>  - copy-firmware.sh: factor out dedup fix broken ad-hoc symlink handling
>  - copy-firmware.sh: remove the hacky argument injection
>  - copy-firmware.sh: warn if the destination folder is NOT empty
>  - copy-firmware.sh: call ./check_whence.py and remove the dead code
>  - Dockerfile: remove unused packages... based on local testing
>
> I've tried to keep the rant to a minimum, thus some commit messages may
> seem sparse. Let me know and I would happily add a few extra words.
>
> As always, input is highly appreciated. Thanks o/
>

Please ignore the series for now... Seems like I've done quite a bad
job at actually testing it

Pardon for the noise o/
Emil
