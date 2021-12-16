Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0374DC433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4D6CC36B06; Thu, 16 Dec 2021 14:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5C9C36AE9
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665757;
	bh=4JUKpaIBe8PoC5ZXlQFADt2QQag2FPsgDYJ9my2kZUw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M1L3sWxl59Ll38VHcVgl4pit00jItu7NJyMADfEE4ozqH15dlmLUkqwCkEWAjY2r5
	 GTQoBT10FQtdCMQFTcBUn5HIPxWux2CGC2WFm3LYFGSE8SbHoTJR9ql3ubh3uX31rU
	 KrtSc2GMjNXCkpt/qi8Hktx7eURbIbPOwycWtX+Gvhg7gQu8Ww3l7nXS/bXrZI9k6k
	 u5klDE/py/cwHKPcT7UKogXIwpwgvBpvwl8iCn56Hl8+QAr/WI1bnPGkgBdygB1P1v
	 cJub/1GdvSbHZBQ/F4Zk1Sk+DSFtmurjJlePUpg5sH4Dx0hP0Onq2sG1PTxVNnQjlT
	 KnyMYR9R00gbw==
Received: by mail-io1-f52.google.com with SMTP id p23so35447101iod.7
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:42:37 -0800 (PST)
X-Gm-Message-State: AOAM530gvgROqY9Ycdc7PY+vh1IELFJOFNTqHyhNO/fgSK7xCHeafX0m
	anuRhpARoH6ozi3r19A1br7oA8YnjHyJxhF6QXI=
X-Google-Smtp-Source: ABdhPJyHsdoc9uGDzyAjEi2R4YESFuYqlFbf40jEBF1Bjm5E8mPLX6TocLNmCQrUbRrjnfF5Jho7U9ZWILBZX8w6rwE=
X-Received: by 2002:a5d:888c:: with SMTP id d12mr9346845ioo.175.1639665757086;
 Thu, 16 Dec 2021 06:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20211206140932.GA3035@chelsio.com>
In-Reply-To: <20211206140932.GA3035@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:42:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6mFs2OAszh-AtpVJvXLBHoi6NNaEDcd3CxWkroG7dERQ@mail.gmail.com>
Message-ID: <CA+5PVA6mFs2OAszh-AtpVJvXLBHoi6NNaEDcd3CxWkroG7dERQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.26.4.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Mon, Dec 6, 2021 at 9:13 AM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit b0e898fbaf377c99a36aac6fdeb7250003648ca4:
>
>   linux-firmware: Update firmware file for Intel Bluetooth 9462 (2021-11-23 12:31:45 -0500)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 38e72a0f98306c4ddb9608d68bf92f0caf5f1ce9:
>
>   cxgb4: Update firmware to revision 1.26.4.0 (2021-12-06 05:07:25 -0800)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.26.4.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/t4fw-1.26.2.0.bin                        | Bin 570368 -> 0 bytes
>  cxgb4/t4fw-1.26.4.0.bin                        | Bin 0 -> 570880 bytes
>  cxgb4/{t5fw-1.26.2.0.bin => t5fw-1.26.4.0.bin} | Bin 676352 -> 676352 bytes
>  cxgb4/{t6fw-1.26.2.0.bin => t6fw-1.26.4.0.bin} | Bin 729088 -> 729600 bytes
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.26.2.0.bin
>  create mode 100644 cxgb4/t4fw-1.26.4.0.bin
>  rename cxgb4/{t5fw-1.26.2.0.bin => t5fw-1.26.4.0.bin} (77%)
>  rename cxgb4/{t6fw-1.26.2.0.bin => t6fw-1.26.4.0.bin} (64%)
