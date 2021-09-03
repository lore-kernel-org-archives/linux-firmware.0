Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36974C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Sep 2021 15:11:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1790C610E6; Fri,  3 Sep 2021 15:11:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0012B60EC0
	for <linux-firmware@kernel.org>; Fri,  3 Sep 2021 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630681902;
	bh=EVuLzOeGlmX0105IcQcxh6XiEi6XDtRF78d23d9tPSY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XbxhK6dSuvivVvsfJbYbXlLi/2NP75FoWKeh0ty/Hx3pkA9jbsmze8qtOjnVFW4Aa
	 R5uPdHJFRMsQvKkaUx1GBAiNAs0cafujSPJx6cT7uTEBHoas74aFFGKrCyU59P6RcB
	 Zhd2JZ7XTcyYrzDP66mzPo/u/q9Z0tbXsOX3DfaSr35f/ssmk2P2d/5dXShC9vDUOy
	 5v7Xs18BmrCfgsTLQVmWMA32CbOYYSejjlsUz0MpG+9PFaLBXcO6Ss6ofksbSKEkNT
	 RDsEX4dMKpW07BzXEYQzoLMDChFbrGCRm4nl4GIpzcLsXQbh7DJnoZSRa1cCE9wmec
	 OLse78HSNOWPg==
Received: by mail-il1-f177.google.com with SMTP id l10so5513183ilh.8
        for <linux-firmware@kernel.org>; Fri, 03 Sep 2021 08:11:41 -0700 (PDT)
X-Gm-Message-State: AOAM531UoDqCVmeLiPIKNB2R2MlksXYWyITYFiX55fwAsZDSdwmA1duy
	+umM8nJQIdSCPJdaiKzmWE7JnbEkb/OcNv5jPUs=
X-Google-Smtp-Source: ABdhPJyvjIPQu+klTicmU5ZrB8D6Ns0JOBtQAsTWFFqN/gORO7NVtVZJs1BeIDlG7ypCzvPq6yO9Yfvn6SJM5ECavLY=
X-Received: by 2002:a05:6e02:2199:: with SMTP id j25mr2961962ila.97.1630681901467;
 Fri, 03 Sep 2021 08:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <515534e0ec166fa55f974a44caad0ef6737d169e.camel@coelho.fi>
In-Reply-To: <515534e0ec166fa55f974a44caad0ef6737d169e.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 3 Sep 2021 11:11:30 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4x_voJh4ZXeYM2jPqTnfb4tC93s4cbTsJ4+SZcMVwiCQ@mail.gmail.com>
Message-ID: <CA+5PVA4x_voJh4ZXeYM2jPqTnfb4tC93s4cbTsJ4+SZcMVwiCQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-09-02
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Sep 2, 2021 at 6:17 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
>
> We accidentally release a couple of binaries that were untested and not
> ready for public release.  This pull request reverts the patch that
> added them so they are not mistakenly used.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 6f5aada830d69e9e086e0ce84a187050ccf0706e:
>
>   linux-firmware: update frimware for mediatek bluetooth chip (MT7921) (2021-09-01 09:43:05 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-09-02
>
> for you to fetch changes up to 359ab775cf55e634abadc99a89eb1e2eabae2d1b:
>
>   Revert "iwlwifi: add FW for new So/Gf device type" (2021-09-02 13:11:39 +0300)
>
> ----------------------------------------------------------------
> Revert accidentally released untested binaries
>
> ----------------------------------------------------------------
> Luca Coelho (1):
>       Revert "iwlwifi: add FW for new So/Gf device type"
>
>  WHENCE                       |   5 -----
>  iwlwifi-so-a0-gf-a0-64.ucode | Bin 1515812 -> 0 bytes
>  iwlwifi-so-a0-gf-a0.pnvm     | Bin 41804 -> 0 bytes
>  3 files changed, 5 deletions(-)
>  delete mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  delete mode 100644 iwlwifi-so-a0-gf-a0.pnvm
>
