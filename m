Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAF4C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 13:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE659C340F5; Fri,  4 Mar 2022 13:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92BEC340F2
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646401587;
	bh=2uwLq/oiwvL/WC4GmnVeBpRHacRMRsaWeoGi4i9NIFY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Uy4n918mqft1QMz+PZFEF/MtXlyNxlyg7MrtOQZjRMnnDYnVKWqtJEmKfufMus5Fi
	 /h0g09NLw2f2Cg/fcjDyBf/GzWO9egOa1m4BDediIqCjpZbRY4mOUDpeWCZAY0fIfZ
	 xROSpq5sm1Mtp6dzQsQEDeCTCo1+5Y1k6yCMRBjZ1rsCzUFreAPWaAbIOUuItu9LjD
	 J9hpAwf0swZU5owKLTBTln1AQJuv3pi1FbQnu2O30NQ2zot8VPhsSn540CNlFLI0jX
	 PtaPrwunST9WfBDT+3tPjzr/wb/Vq63l7XYpFkDdjuqFgBwCjY6Wr+avq+8nYHjoKS
	 gfShsUR2mxjZA==
Received: by mail-io1-f54.google.com with SMTP id r11so4888945ioh.10
        for <linux-firmware@kernel.org>; Fri, 04 Mar 2022 05:46:27 -0800 (PST)
X-Gm-Message-State: AOAM531lBAPU03w23Vu5Qs716sR2/y44DrjGzqEpW+U5OBrM9LGbFaD5
	FDPCvnVcP51FjgDe5cBvikXhFW+jQUbCWcvNilg=
X-Google-Smtp-Source: ABdhPJwgIuUbcwSbh/R79ULunuWQDXLSpDS+7mkJEJearmguBRKZ/NrqnBJLkBoFQ0fmLjPT7glnNrdT9TV36+ZShNY=
X-Received: by 2002:a02:c850:0:b0:30e:54b4:d8de with SMTP id
 r16-20020a02c850000000b0030e54b4d8demr33010884jao.146.1646401587030; Fri, 04
 Mar 2022 05:46:27 -0800 (PST)
MIME-Version: 1.0
References: <af43569b2247f7aff44b1ea3680d88dbe083d78d.camel@coelho.fi>
In-Reply-To: <af43569b2247f7aff44b1ea3680d88dbe083d78d.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Mar 2022 08:46:16 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
Message-ID: <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-03-03
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 6:11 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.


[jwboyer@vader linux-firmware]$ ./check_whence.py
E: iwlwifi-QuZ-a0-jf-b0-71.ucode listed in WHENCE does not exist
E: iwlwifi-so-a0-hr-b0-71.ucode listed in WHENCE does not exist
E: iwlwifi-so-a0-jf-b0-71.ucode listed in WHENCE does not exist
[jwboyer@vader linux-firmware]$

Can you fix that up please?

josh

> --
> Cheers,
> Luca.
>
>
> The following changes since commit ee0667aa201e7d725ec87b1e4cf08de1d748d64f:
>
>   amdgpu: update raven2 VCN firmware (2022-02-28 09:44:17 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-03-03
>
> for you to fetch changes up to ba104c67dfb838e892b6b4c72569aa7f1ee955a2:
>
>   iwlwifi: add new FWs from core68-60 release (2022-03-03 13:00:52 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core68-60
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 9000-family firmwares to core68-60
>       iwlwifi: add new FWs from core68-60 release
>
>  WHENCE                            |  40 ++++++++++++++++++++++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519544 -> 1520208 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490376 -> 1491056 bytes
>  iwlwifi-Qu-b0-hr-b0-71.ucode      | Bin 0 -> 1364312 bytes
>  iwlwifi-Qu-b0-jf-b0-71.ucode      | Bin 0 -> 1285192 bytes
>  iwlwifi-Qu-c0-hr-b0-71.ucode      | Bin 0 -> 1364328 bytes
>  iwlwifi-Qu-c0-jf-b0-71.ucode      | Bin 0 -> 1285208 bytes
>  iwlwifi-QuZ-a0-hr-b0-71.ucode     | Bin 0 -> 1364308 bytes
>  iwlwifi-cc-a0-71.ucode            | Bin 0 -> 1322288 bytes
>  iwlwifi-so-a0-gf-a0-71.ucode      | Bin 0 -> 1550124 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41808 -> 41808 bytes
>  iwlwifi-so-a0-gf4-a0-71.ucode     | Bin 0 -> 1566352 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 28064 bytes
>  iwlwifi-ty-a0-gf-a0-71.ucode      | Bin 0 -> 1494024 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41588 -> 41588 bytes
>  15 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-cc-a0-71.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-71.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-71.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-71.ucode
>
