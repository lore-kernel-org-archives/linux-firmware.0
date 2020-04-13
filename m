Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3380C2BA19
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Apr 2020 12:18:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D462F20767; Mon, 13 Apr 2020 12:18:58 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B667B20753
	for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586780338;
	bh=c74x26MjbhW6FJi4KJh/Snlaek1YakuuhaxsrHl36Vw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Gt1CljGoafgJ8i/kgPgsuDD429QVsbpLG5cIOC1HSo2CfPQSTgseF6QMewbhuSBO8
	 vX0/DTWnQ2sDWXZ+hvBWCjnqrq6HWAtCvRxdRpM5mLTqH4WwzYq0wGOuA57vJpkkZH
	 hMnhe3XshJhAtsaB/mRpllfOxiwzsHNhizM0lWng=
Received: by mail-io1-f42.google.com with SMTP id f19so9096626iog.5
        for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 05:18:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuYdAXzxe/X38jRUwq6NowmjSu9E7XPR0tbMQ7OBdd2BiY5eSnIq
	2ynscTjf21M54zUNt8pGy9JJh5EZ1oaobEB2CK0=
X-Google-Smtp-Source: APiQypKUW7G2If6TSQb47Oqet0gTdKUSv7+oLTpSDZY9cvuYNG7zuG4zNDJWE0oSEHzkCwXV1seXqkI8qIJDfBAgD7E=
X-Received: by 2002:a5d:9c87:: with SMTP id p7mr15629635iop.158.1586780338172;
 Mon, 13 Apr 2020 05:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200410201053.GA786355@builder.lan>
In-Reply-To: <20200410201053.GA786355@builder.lan>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Apr 2020 08:18:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6TYrxjEhFZiaabXrp3zMnzY3ABbtABj1vO2Trn0FKSeQ@mail.gmail.com>
Message-ID: <CA+5PVA6TYrxjEhFZiaabXrp3zMnzY3ABbtABj1vO2Trn0FKSeQ@mail.gmail.com>
Subject: Re: qcom: Add SDM845 Adreno ZAP shader firmware
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 10, 2020 at 4:10 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The following changes since commit edf390c23a4e185ff36daded36575f669f5059f7:
>
>   Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp (2020-03-20 07:39:19 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/andersson/linux-firmware.git a630-zap
>
> for you to fetch changes up to e6ff1e706e8befd0530f7300bc7f89203d4fe90a:
>
>   qcom: Add SDM845 Adreno ZAP shader firmware (2020-04-10 13:05:22 -0700)
>
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       qcom: Add SDM845 Adreno ZAP shader firmware
>
>  WHENCE                   |   1 +
>  qcom/sdm845/a630_zap.mbn | Bin 0 -> 14256 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/sdm845/a630_zap.mbn

Pulled and pushed out.

josh
