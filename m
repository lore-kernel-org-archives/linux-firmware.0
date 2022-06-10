Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A921C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7491CC341C5; Fri, 10 Jun 2022 11:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA65C385A2
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654860073;
	bh=zTQ72fBTCZap5xCge7yQBtsGvdOqAFa1LSvr6pHAHtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UZBh50IUIFCKszbb9oNXMuXoC3HB7Iqr/gYZROZsX4ApLgqYquJGwEgaJDP1EN2CH
	 YVcnaf6ZE6cwJ6//NecsBkhcvn9NfzACZdzxPD9AX0tj3gBleETs31oyJN2QofxQmc
	 y/JkS2cJ0jCAlQ7NXPqnLyyvKamc7GkENluwPg09ELhy/kH52Xrp0cN0fCr4SAoEV0
	 4UqCQIhMjElc9wOq0Cjv5+twm4nDGgmpmxNJv1Lmw233cra3UJuUmxn2hLV1YMu6V5
	 g94NRthJmLtP6JZH9mQzCSI0t/ecWlvEPntf6vvZFQaEFxxE4L23XKFFeg1EOlcCxj
	 jYlgZigFQK9LQ==
Received: by mail-il1-f178.google.com with SMTP id v7so20696895ilo.3
        for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 04:21:13 -0700 (PDT)
X-Gm-Message-State: AOAM533oeCUqTwyUY6fRBuAw2fZdzWxme9AzlvGNx33qT2096zywzeTw
	0baQGrEwwJa/8fRgKNzl5LD6/K8C6RhaJxCz414=
X-Google-Smtp-Source: ABdhPJzL5qwjdcTRqSdn4ypqo3LhdoRVa94WXthCtaBSgtcRZs4Q/CQ2vHBJ1WSToe/9tkwoyCofU2n6491yjn3Ecxo=
X-Received: by 2002:a05:6e02:170f:b0:2d3:dc72:7172 with SMTP id
 u15-20020a056e02170f00b002d3dc727172mr25707143ill.218.1654860072581; Fri, 10
 Jun 2022 04:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <9ec532a3e9c5b67bcb00e64c0cbe9b371e9509cc.camel@intel.com> <2d4e7c863938728e661e7bf93f42d26ee8456c58.camel@intel.com>
In-Reply-To: <2d4e7c863938728e661e7bf93f42d26ee8456c58.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jun 2022 07:21:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7_cORzYdNZ5RPGNKEdWS6wTETD92SP+=+kyWyMKZx0gw@mail.gmail.com>
Message-ID: <CA+5PVA7_cORzYdNZ5RPGNKEdWS6wTETD92SP+=+kyWyMKZx0gw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates iwlwifi-fw-2022-06-09
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Coelho, Luciano" <luciano.coelho@intel.com>, "Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.  Thanks.

josh

On Thu, Jun 9, 2022 at 2:51 PM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> On Thu, 2022-06-09 at 16:13 +0300, Greenman, Gregory wrote:
> > Hi,
> >
> > I'm the new maintainer of iwlwifi driver, adding Luca in cc for my first
> > pull request.
> >
> > This contains some new and updated firmwares for all our currently
> > maintained FW binaries.
> >
> > Please pull or let me know if there are any issues.
> >
> > --
> > Thanks,
> > Gregory
> >
> > The following changes since commit 02c69863c885db963f8c0121b533f2816ef5be3b:
> >
> >   rtl_bt: Update RTL8852A BT USB firmware to 0xDFB8_0634 (2022-06-07 08:32:39 -0400)
> >
> > are available in the Git repository at:
> >
> > http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-06-09
> >
> > for you to fetch changes up to 99cb4b095b7679596ed9fbf1578568df18377866:
> >
> >   iwlwifi: add new FWs from core70-87 release (2022-06-09 10:19:32 +0300)
> >
> > ----------------------------------------------------------------
> > Update and add iwlwifi firmware binaries for release Core70-87
> >
> > ----------------------------------------------------------------
> > Gregory Greenman (2):
> >       iwlwifi: update 9000-family firmwares to core70-87
> >       iwlwifi: add new FWs from core70-87 release
> >
> >  WHENCE                            |  40
> > ++++++++++++++++++++++++++++++++++++++--
> >  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1520208 -> 1518788 bytes
> >  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1491056 -> 1489548 bytes
> >  iwlwifi-Qu-b0-hr-b0-73.ucode      | Bin 0 -> 1369840 bytes
> >  iwlwifi-Qu-b0-jf-b0-73.ucode      | Bin 0 -> 1290084 bytes
> >  iwlwifi-Qu-c0-hr-b0-73.ucode      | Bin 0 -> 1369856 bytes
> >  iwlwifi-Qu-c0-jf-b0-73.ucode      | Bin 0 -> 1290100 bytes
> >  iwlwifi-QuZ-a0-hr-b0-73.ucode     | Bin 0 -> 1369976 bytes
> >  iwlwifi-QuZ-a0-jf-b0-73.ucode     | Bin 0 -> 1290220 bytes
> >  iwlwifi-cc-a0-73.ucode            | Bin 0 -> 1333296 bytes
> >  iwlwifi-so-a0-gf-a0-73.ucode      | Bin 0 -> 1563692 bytes
> >  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41808 -> 41808 bytes
> >  iwlwifi-so-a0-gf4-a0-73.ucode     | Bin 0 -> 1587800 bytes
> >  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 28064 -> 28064 bytes
> >  iwlwifi-so-a0-hr-b0-73.ucode      | Bin 0 -> 1465208 bytes
> >  iwlwifi-so-a0-jf-b0-73.ucode      | Bin 0 -> 1409336 bytes
> >  iwlwifi-ty-a0-gf-a0-73.ucode      | Bin 0 -> 1502900 bytes
> >  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41588 -> 41588 bytes
> >  18 files changed, 38 insertions(+), 2 deletions(-)
> >  create mode 100644 iwlwifi-Qu-b0-hr-b0-73.ucode
> >  create mode 100644 iwlwifi-Qu-b0-jf-b0-73.ucode
> >  create mode 100644 iwlwifi-Qu-c0-hr-b0-73.ucode
> >  create mode 100644 iwlwifi-Qu-c0-jf-b0-73.ucode
> >  create mode 100644 iwlwifi-QuZ-a0-hr-b0-73.ucode
> >  create mode 100644 iwlwifi-QuZ-a0-jf-b0-73.ucode
> >  create mode 100644 iwlwifi-cc-a0-73.ucode
> >  create mode 100644 iwlwifi-so-a0-gf-a0-73.ucode
> >  create mode 100644 iwlwifi-so-a0-gf4-a0-73.ucode
> >  create mode 100644 iwlwifi-so-a0-hr-b0-73.ucode
> >  create mode 100644 iwlwifi-so-a0-jf-b0-73.ucode
> >  create mode 100644 iwlwifi-ty-a0-gf-a0-73.ucode
> >
>
> I forgot to cc linux-wireless in the original pull request,
> so adding it here.
