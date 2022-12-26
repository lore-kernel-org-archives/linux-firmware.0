Return-Path: <SRS0=A8LV=4Y=gmail.com=azamat.hackimov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7AAC4167B
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Dec 2022 10:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9FBFC433EF; Mon, 26 Dec 2022 10:02:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DD27C433D2;
	Mon, 26 Dec 2022 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DD27C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id h8so5024317qkk.8;
        Mon, 26 Dec 2022 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rADPLLaKuuwX5UILAiwAsZOWyBkfJpXrRH/PZpDGpnQ=;
        b=b3kNBYftcO4SZQXY5tFCC4oPsKy6a3fwbOfkja/t1HRhkt0RkYQ8j3idN7QTsZMJc7
         VcCdQekw6lZ8ZpGxQOIFxNlawhhwSiZ9+F771W8FCQq+lb+7q171xxEwdUcqtteJNM9T
         EjJfONV2LzOxlRqTrz0onbYjhSQnn5uAcauD5FaeTeEaNAlkbTERv7YR4obDALTHaNxh
         Kl5LsdC7FmPV3F+ZO5E3tYFVZ4wGz/yZOtS7rX7l6EMB6/X5qmQ5HqK4ONtmRXx7Gdui
         AGytrjrqfpAQa9dxeXtyx4CglEQQt7gm+/VHu2xtVxOa56XWGCyvBit1RADses576+Ai
         HWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rADPLLaKuuwX5UILAiwAsZOWyBkfJpXrRH/PZpDGpnQ=;
        b=unWUCNBMwlYx+VcvNSsmZpC8HEKoTWZ4lxxDGQVbO03XBDN3CxGzopK/UXA6zTHfGS
         bAaOrKWBWPpCHY+BoCVvBmfWtpQhxhDLzLfUdP1Y4EX2moyM8bixvwJw76E/O+J3KL29
         cl59Ly4K9bpeYVLvBWNGDysg0g8/rWWAhRx3fxgY/vTE1esMog9+OwjlYckQcLUbqXuH
         cYpMi15lXEaY908JOgOCgznxU+8qr4R+DVpjeWdrqS/L6/sArUacifxUaj/VGtqwKgJr
         8ot3lpJr6BXJQEkmkW0fNSyDCBdJkDf0EIoyZF7Ys7KKVywI0lGwo2VZB+hXO0SPRu/v
         o+cg==
X-Gm-Message-State: AFqh2kplmaMnWQJYWBm47cdceRkrmiAM8cQP7eWBNAp3s75pZYxyJ7aV
	uTPTHYfZq7kMRt4F4hCfiKn4fxF4QwzXU5F9rsb7lV8iMjY=
X-Google-Smtp-Source: AMrXdXsXI3GrZafH75gaqgkhOqtwxqOmrFK7b0s8+omZnNYx4xwy2fl2wXTwQw/HpWsbb3HVU97pGkTljFuDX0PVeZI=
X-Received: by 2002:a05:620a:12eb:b0:702:1765:8f38 with SMTP id
 f11-20020a05620a12eb00b0070217658f38mr1003975qkl.608.1672048964334; Mon, 26
 Dec 2022 02:02:44 -0800 (PST)
MIME-Version: 1.0
References: <CAFqVybqsda75NPUAYX47FCQp0OAkRWOUw7K9UbPawbNo=Th2bQ@mail.gmail.com>
 <CA+5PVA4SOyhji1Y-OzFkAJsRz6k70qdKOOvPEKN4PyCBUygCsA@mail.gmail.com> <CAFqVybrYZLf31S9MYWrgSRTvi_HH0yWr1rJq21Dnsw91p=Debg@mail.gmail.com>
In-Reply-To: <CAFqVybrYZLf31S9MYWrgSRTvi_HH0yWr1rJq21Dnsw91p=Debg@mail.gmail.com>
From: Azamat Hackimov <azamat.hackimov@gmail.com>
Date: Mon, 26 Dec 2022 13:02:33 +0300
Message-ID: <CAFqVybraTM__SJSFr4P70J+qVcLNaHd=V4gUcFyBxs088qkadQ@mail.gmail.com>
Subject: Re: Feature request: Adding tools to be able to split the
 linux-firmware package into separate components
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

Is there any feedback or suggestions?

=D0=B2=D1=81, 6 =D0=BD=D0=BE=D1=8F=D0=B1. 2022 =D0=B3. =D0=B2 20:53, Azamat=
 Hackimov <azamat.hackimov@gmail.com>:
>
> Hello again.
>
> Josh, thank you for your feedback. The main idea for the new feature
> was to create a tool for more efficient control for obtaining
> information and selective installation of project files. I created a
> feature request to get some feedback and general impression of the
> idea and planned to implement it myself. So, based on the feedback, I
> implemented the necessary changes and published them in the
> https://github.com/winterheart/linux-firmware repository (yaml
> branch).
>
> I will briefly list the new features. All functionality is
> concentrated in firmware-install.py and WHENCE.yaml files. The
> functionality is implemented in such a way that it does not interfere
> with the existing check_whence.py and copy-firmware.sh in any way
> (that is, you can use either one or that without losing
> functionality). firmware-install.py requires Python 3 (tested with
> Python 3.10) and the pyyaml (to load WHENCE.yaml) and marshmallow (to
> deserialize and validate the processed data) packages to run. All
> packages are available in the repositories of most Linux
> distributions, for example on Debian / Ubuntu they can be installed as
> follows:
>
> apt-get install python-marshmallow pyyaml
>
> firmware-install.py supports the following types of commands (run
> `./firmware-install.py -h` and `./firmware-install.py COMMAND -h` for
> additional info):
>
> * check - fully checks the contents of the repository in a way similar
> to check_whence.py, and also validates the schema and contents of
> WHENCE.yaml
> * info - displays information on records according to the specified
> selection criteria
> * install - installs to the specified directory according to the
> specified selection criteria
> * list - displays a list of possible values for entries, vendors,
> categories or licenses
>
> The install command without additional options will perform a full
> installation in exactly the same way as copy-firmware.sh. The contents
> of the installation directories in this case will be identical.
>
> Work example of info subcommand:
>
> ./firmware-install.py info -n bnx2
> Entry: bnx2
> Description: Broadcom NetXtremeII
> Categories:
>   - drivers/net/ethernet
> Vendor: Broadcom
> License:
>   Name: Redistributable
>   Copyright: Copyright (c) 2004-2010 Broadcom Corporation
>   Info: This file contains firmware data derived from proprietary unpubli=
shed
> source code, Copyright (c) 2004 - 2010 Broadcom Corporation.
>
> Permission is hereby granted for the distribution of this firmware data
> in hexadecimal or equivalent format, provided this copyright notice is
> accompanying it.
>
> Info:
> Found in hex form in kernel source.
> Size: 215,144 bytes
> Files:
>   - bnx2/bnx2-mips-06-6.2.3.fw
>   - bnx2/bnx2-mips-09-6.2.1b.fw
>   - bnx2/bnx2-rv2p-06-6.0.15.fw
>   - bnx2/bnx2-rv2p-09-6.0.17.fw
>   - bnx2/bnx2-rv2p-09ax-6.0.17.fw
> Links:
> None
> --------
>
> The WHENCE.yaml format is detailed in the updated README and allows
> you to enter any information. Content of WHENCE.yaml currently
> synchronized with last commit in main branch of linux-firmware
> repository (commit 8bb7562).
>
> Please take a look and try new functionality. If you have any
> additional questions, I will be happy to answer them.
>
> --
> From Siberia with Love!



--=20
From Siberia with Love!
