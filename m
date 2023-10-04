Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7F2E7B5F9
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Oct 2023 11:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1F2DC43391; Wed,  4 Oct 2023 11:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAEBC433D9
	for <linux-firmware@kernel.org>; Wed,  4 Oct 2023 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696420169;
	bh=VlU3YIQE7HYFy/oNnXxRGhVieetVkB0NhxuB0lBN6fg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PvV//gkyrupxNa/TBqmWePru8V8kPbS0DBSZ6VE1Lxoy3Jg8yVSrpu2L8k60U5gFx
	 n3IAGSXHQgbscB7EI7FA8HPXtgNeGJ2b0AdHQQI6m2FIWGUmqqu0tNp0cSU1KHI3tu
	 ps7cCiYfVUD80cO/mXHbmziB1eRyXhQCEm7h3Zrv3U5rajK0LlajyB0QCsIRRvVS/S
	 CZ7y+Bdr32GAor4EM2H8/IJi6GA3zpK+0ks61reHocgfSmEQ38y0nNaTfUjpg3oNnA
	 VTgVQ+2TGuiZhWZaMvsVw7hHZbVTIhX0k9dKzkmr4CJl/6CgX9Lvu/gg2cnl1DlDR5
	 jmhH6oLv8nBug==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59e77e4f707so24824407b3.0
        for <linux-firmware@kernel.org>; Wed, 04 Oct 2023 04:49:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmZwyTDtya51MXG8OH5v0EoyW/2o44ggYiZ9sqz4wwzxPIufpz
	UXRemWyDO8Lhx6+XWBrQyFF0i08Mog070V8B0po=
X-Google-Smtp-Source: AGHT+IEiott/iw/9uCMEWLEB2rm5mFJmiw5iqPQ+X1iXBhJae3U+23r8Rx3CWbGAaGVj+N4J+rVbcHvUarX6avttSYE=
X-Received: by 2002:a25:a407:0:b0:d7b:985b:278f with SMTP id
 f7-20020a25a407000000b00d7b985b278fmr1610920ybi.16.1696420168892; Wed, 04 Oct
 2023 04:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <edb251a86c9cc6c3fcdfa9b4304d9a7ae9c074dc.camel@intel.com>
In-Reply-To: <edb251a86c9cc6c3fcdfa9b4304d9a7ae9c074dc.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Oct 2023 07:49:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA56t896+zTs2Ed5im4ASb9JYkydeS=rAgFmupyagGNepQ@mail.gmail.com>
Message-ID: <CA+5PVA56t896+zTs2Ed5im4ASb9JYkydeS=rAgFmupyagGNepQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-09-27
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 4:24=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains several new firmwares along with PNVM files
> for the new GL/MA devices.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory
>
> The following changes since commit 8b855f3797e6b1d207b7a2b8dae0e9913f907e=
5b:
>
>   Merge branch 'main' into 'main' (2023-09-26 18:31:16 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-09-27

Pulled and pushed out.

josh

>
> for you to fetch changes up to a6744df81a307cfee5b0271dae65f8fcdeb84fcf:
>
>   iwlwifi: add FWs for new GL and MA device types with multiple RF module=
s (2023-09-27 11:05:10 +0300)
>
> ----------------------------------------------------------------
> add FWs for new GL and MA device types with multiple RF modules
> GL and MA HWs with Gf/Gf4/Hr radio modules.
>
> ----------------------------------------------------------------
> Gregory Greenman (1):
>       iwlwifi: add FWs for new GL and MA device types with multiple RF mo=
dules
>
>  WHENCE                        |  18 ++++++++++++++++++
>  iwlwifi-gl-c0-fm-c0-83.ucode  | Bin 0 -> 1799504 bytes
>  iwlwifi-gl-c0-fm-c0.pnvm      | Bin 0 -> 246228 bytes
>  iwlwifi-ma-b0-gf-a0-83.ucode  | Bin 0 -> 1753308 bytes
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 0 -> 55500 bytes
>  iwlwifi-ma-b0-gf4-a0-83.ucode | Bin 0 -> 1721448 bytes
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 0 -> 28024 bytes
>  iwlwifi-ma-b0-hr-b0-83.ucode  | Bin 0 -> 1572104 bytes
>  8 files changed, 18 insertions(+)
>  create mode 100644 iwlwifi-gl-c0-fm-c0-83.ucode
>  create mode 100644 iwlwifi-gl-c0-fm-c0.pnvm
>  create mode 100644 iwlwifi-ma-b0-gf-a0-83.ucode
>  create mode 100644 iwlwifi-ma-b0-gf-a0.pnvm
>  create mode 100644 iwlwifi-ma-b0-gf4-a0-83.ucode
>  create mode 100644 iwlwifi-ma-b0-gf4-a0.pnvm
>  create mode 100644 iwlwifi-ma-b0-hr-b0-83.ucode
