Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F214EC001DB
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Aug 2023 12:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4534C433C9; Fri,  4 Aug 2023 12:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94174C433CA
	for <linux-firmware@kernel.org>; Fri,  4 Aug 2023 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691151118;
	bh=ZyRwntOMV8lbpna7jlzOBADYElmt6HRGHtGaDIoq0a8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oo0MNkpnm4mm1ZRzlYs+/ZhQg1z6sw7SRXafmgxTCGU8PxT7fdfAslYzeZC4NlRly
	 LmfK8s7ABVm5CLXPT3mPJar+6i4O6RKGVXlizLZ+QqoBxBtaABXuJkGVAaVy/94lDg
	 Am5hfDpWn+KRyokB/c0O8Zo2N65TMmFrRSBEEjvPyHDusWTh8MeRMEcbXco0VbPnRk
	 L9hkweYK7pjnmQu0lWwtqw6j3ZpEwd6Pk8QoTX5aO+Jiiz5e25W6YkgWlewHBw4+OM
	 WgaiJCWnU6rLQLgbevfJQk3xe7t2z/ei/qoIaAtKSr9cOwtDN7A4s9C7MmvNOe2OLP
	 7O2j4blffoOjQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d0548cf861aso2201351276.3
        for <linux-firmware@kernel.org>; Fri, 04 Aug 2023 05:11:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YySQDrqSa1ciWREHqkqn7JzZkYki3Ibt5SQNJepLo76M+LvLZgj
	kfe5DstsEucwJr97KrVcYjXwWxVlAgCwuKgtO4s=
X-Google-Smtp-Source: AGHT+IFY3HQaoG2W1+Leo4Q4VubB3mw703IcyyT5rDftxGhxBE+h2Q7ypOfIa69rSyVp+fHHyxwd7CapE7dTsO8J37c=
X-Received: by 2002:a25:c706:0:b0:c42:6af7:bb90 with SMTP id
 w6-20020a25c706000000b00c426af7bb90mr1380143ybe.33.1691151117592; Fri, 04 Aug
 2023 05:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230802104137.1282273-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802104137.1282273-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Aug 2023 08:11:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7BYzSufrenvOd-7TaqRC0m-+j=Pvv=aiOrR8n_sVYEbQ@mail.gmail.com>
Message-ID: <CA+5PVA7BYzSufrenvOd-7TaqRC0m-+j=Pvv=aiOrR8n_sVYEbQ@mail.gmail.com>
Subject: Re: [PULL] qcom: add RB3/db845c sensors DSP firmware
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 6:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add the firmware for the sensors DSP used on the Dragonboard 845c aka Qua=
lcomm
> Robotics RB3 platform.
>
> The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf=
6d:
>
>   Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-=
07-07 15:24:32 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb3-update

Pulled and pushed out.

josh

>
> for you to fetch changes up to 742bf577e1406f61716f477fa47e868765596dce:
>
>   qcom: sdm845: add RB3 sensors DSP firmware (2023-08-02 03:42:15 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qcom: sdm845: add RB3 sensors DSP firmware
>
>  WHENCE                                    |   3 +++
>  qcom/sdm845/Thundercomm/db845c/slpi.mbn   | Bin 0 -> 7028860 bytes
>  qcom/sdm845/Thundercomm/db845c/slpir.jsn  |  21 +++++++++++++++++++++
>  qcom/sdm845/Thundercomm/db845c/slpius.jsn |  21 +++++++++++++++++++++
>  4 files changed, 45 insertions(+)
>  create mode 100644 qcom/sdm845/Thundercomm/db845c/slpi.mbn
>  create mode 100644 qcom/sdm845/Thundercomm/db845c/slpir.jsn
>  create mode 100644 qcom/sdm845/Thundercomm/db845c/slpius.jsn
