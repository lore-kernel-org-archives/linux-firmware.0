Return-Path: <SRS0=bWOt=3G=gmail.com=azamat.hackimov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE8C433FE
	for <linux-firmware@archiver.kernel.org>; Sun,  6 Nov 2022 17:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98038C433D7; Sun,  6 Nov 2022 17:54:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B741C433D6;
	Sun,  6 Nov 2022 17:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B741C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id t10so13186671ljj.0;
        Sun, 06 Nov 2022 09:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P6GmVObtj1sNMHRiysMnHdJ37RnTgF9ZHykV1RiQyJk=;
        b=W2iJqdZh3hNMuZvqi73IYPDMUMHQk4nrssB5QZZGszpbVX43O2G6P3RKuKNu6YZx+i
         x6sJoVeFWiULxQykNtqUoX/e4XsGC4/gjA/kOTek+Y9FDCpu4XhQ5+Pv5AVLaQCFMlL0
         RUh2c/+UOQRXzmA0mF0cEcZkiK/C0RuYWsZVbqhL6ymcZVG0wsyTF4h3/4DzJtreWIAZ
         QUPpTquIfx6bFQELWf6N06ixKKWxvjOfnClFOo9c/hUcHGSBG6wtnP+1zK6Dsao6hKT/
         S9MUDFksTUFi+BESqhWb5jkRipHbWgnhDnPi7VhsTf7RTRrCL2cF905HiHweC22c9hbh
         X2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6GmVObtj1sNMHRiysMnHdJ37RnTgF9ZHykV1RiQyJk=;
        b=DnyjESf13Rzsy+HsokstMa9/5R0f+jdxDYxuK3htcy2Si5o7VlOK2YZzGjWO2sZSMP
         GPLLFVSHo+ZFnsc6aC3PqxTUGepcMoj/1T3a2YM0MyiwXcFS51Ac4fenqn/B6bjrfK8W
         yiQY8+qjuVcWxcwWvd+qxFQxes/1fRc8SgY5+leXRWdEquHgqx3BcUEtQ2uOjYMIx1bb
         HvPwEERYOC0gbO8BPVawIiw/A33kWr0bsY/Cix48CGmGRaKWqisnWs5OYt5c7itkjHEF
         RjyKcsytMYfkAlIfW97y11KOp46ETxg0RJL+KgIHqs+XkNX+E3JXjJgsf+KOADDMw5ls
         XLcg==
X-Gm-Message-State: ACrzQf3gdArJtusHntBaVt643a3S9artqV6FCCAbECtP0BbIsUMUBPXg
	+e3+WuV0K4UlnoLBkoXf2wl14h3LKCIYqvK+dTCcNd4+P1UC6g==
X-Google-Smtp-Source: AMsMyM6js/JEfR9tVLuNLei0rSfM6FOjtqP99xnxmHfz3UcHCjlT7YzfB5NR3yA/815g4+8X4WiqzLscoJ9uDJtYGm8=
X-Received: by 2002:a05:651c:94:b0:26f:c081:9aee with SMTP id
 20-20020a05651c009400b0026fc0819aeemr4459012ljq.219.1667757243868; Sun, 06
 Nov 2022 09:54:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFqVybqsda75NPUAYX47FCQp0OAkRWOUw7K9UbPawbNo=Th2bQ@mail.gmail.com>
 <CA+5PVA4SOyhji1Y-OzFkAJsRz6k70qdKOOvPEKN4PyCBUygCsA@mail.gmail.com>
In-Reply-To: <CA+5PVA4SOyhji1Y-OzFkAJsRz6k70qdKOOvPEKN4PyCBUygCsA@mail.gmail.com>
From: Azamat Hackimov <azamat.hackimov@gmail.com>
Date: Sun, 6 Nov 2022 20:53:52 +0300
Message-ID: <CAFqVybrYZLf31S9MYWrgSRTvi_HH0yWr1rJq21Dnsw91p=Debg@mail.gmail.com>
Subject: Re: Feature request: Adding tools to be able to split the
 linux-firmware package into separate components
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello again.

Josh, thank you for your feedback. The main idea for the new feature
was to create a tool for more efficient control for obtaining
information and selective installation of project files. I created a
feature request to get some feedback and general impression of the
idea and planned to implement it myself. So, based on the feedback, I
implemented the necessary changes and published them in the
https://github.com/winterheart/linux-firmware repository (yaml
branch).

I will briefly list the new features. All functionality is
concentrated in firmware-install.py and WHENCE.yaml files. The
functionality is implemented in such a way that it does not interfere
with the existing check_whence.py and copy-firmware.sh in any way
(that is, you can use either one or that without losing
functionality). firmware-install.py requires Python 3 (tested with
Python 3.10) and the pyyaml (to load WHENCE.yaml) and marshmallow (to
deserialize and validate the processed data) packages to run. All
packages are available in the repositories of most Linux
distributions, for example on Debian / Ubuntu they can be installed as
follows:

apt-get install python-marshmallow pyyaml

firmware-install.py supports the following types of commands (run
`./firmware-install.py -h` and `./firmware-install.py COMMAND -h` for
additional info):

* check - fully checks the contents of the repository in a way similar
to check_whence.py, and also validates the schema and contents of
WHENCE.yaml
* info - displays information on records according to the specified
selection criteria
* install - installs to the specified directory according to the
specified selection criteria
* list - displays a list of possible values for entries, vendors,
categories or licenses

The install command without additional options will perform a full
installation in exactly the same way as copy-firmware.sh. The contents
of the installation directories in this case will be identical.

Work example of info subcommand:

./firmware-install.py info -n bnx2
Entry: bnx2
Description: Broadcom NetXtremeII
Categories:
  - drivers/net/ethernet
Vendor: Broadcom
License:
  Name: Redistributable
  Copyright: Copyright (c) 2004-2010 Broadcom Corporation
  Info: This file contains firmware data derived from proprietary unpublished
source code, Copyright (c) 2004 - 2010 Broadcom Corporation.

Permission is hereby granted for the distribution of this firmware data
in hexadecimal or equivalent format, provided this copyright notice is
accompanying it.

Info:
Found in hex form in kernel source.
Size: 215,144 bytes
Files:
  - bnx2/bnx2-mips-06-6.2.3.fw
  - bnx2/bnx2-mips-09-6.2.1b.fw
  - bnx2/bnx2-rv2p-06-6.0.15.fw
  - bnx2/bnx2-rv2p-09-6.0.17.fw
  - bnx2/bnx2-rv2p-09ax-6.0.17.fw
Links:
None
--------

The WHENCE.yaml format is detailed in the updated README and allows
you to enter any information. Content of WHENCE.yaml currently
synchronized with last commit in main branch of linux-firmware
repository (commit 8bb7562).

Please take a look and try new functionality. If you have any
additional questions, I will be happy to answer them.

-- 
From Siberia with Love!
