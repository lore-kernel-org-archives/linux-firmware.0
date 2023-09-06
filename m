Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD1EB8FB6
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 759ACC433C9; Wed,  6 Sep 2023 11:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDDBC433CA;
	Wed,  6 Sep 2023 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693999028;
	bh=XRzL6qdmBQtHVaGQm07QtLPaLqubXpcpmOgbpiXWbCE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dEeBbdmpxppxSsMAKpi1WeQgUes2UY01Mi8U3L8n5T+Q4RBYWQsGjylgsVREAf0fT
	 /NiPjNaRuK/2eBBPTN4RwL/R53Et4TF0OTip94DyBrOLe59KY7Bf5VgaBelKWhuVu0
	 OvN1zEsb8ctVKSSYiTV2XLzrAGAIjWIxZewXk/J99nyHBH6YcK1t2xWyjYE4iTO4zw
	 1KdcR29F2oraR7evzs6g4zawiVcROo5vj44aBEKc0LwZikEyfCJr22uzbqbDmCbXrt
	 JyuJ+rBuDVg+OnjDm/c0VZfkdO5jmIBBmAQ18pocNwMrqOXaYP+890+XHK54xwWf0B
	 TJHqi5Ik8qB+w==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so2994879276.2;
        Wed, 06 Sep 2023 04:17:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YxoAlU9n9Xw6qPE9rXhfLAYdRfcB5swlQ+3Z16WS0e6TEknLwDx
	ccT9lcDVVeuTGBKNV/V6+XVicV+C1zl2yr/9aHc=
X-Google-Smtp-Source: AGHT+IGEHPoj7BujhGfWarJlgQvDTwoMF67OgkDpfAdq0MqS8uBLmgVKsF6Tn5IWuAxBzVIhM/htaLYHW8pWSOr+ixM=
X-Received: by 2002:a25:cfd7:0:b0:d78:18c3:23dd with SMTP id
 f206-20020a25cfd7000000b00d7818c323ddmr16678684ybg.62.1693999027389; Wed, 06
 Sep 2023 04:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Sep 2023 07:16:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
Message-ID: <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Please pull in firmware files for new Thundercomm boards, Qualcomm Roboti=
cs RB1
> and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, vide=
o
> en/decoder (venus) and Adreno GPU firmware files.
>
> The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8dd=
b5:
>
>   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2=
023-08-04 06:33:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb12-fw-v2
>
> for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632be:
>
>   qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-08-2=
3 20:24:47 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (5):
>       qcom: add GPU firmware for QCM2290 / QRB2210
>       qcom: add firmware for QCM2290 platforms
>       qcom: add firmware for QRB4210 platforms
>       qcom: add venus firmware files for v6.0
>       qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
>
>  WHENCE                    |  27 +++++++++++++++++++++++++++

This conflicts in WHENCE now with the addition of the RawFile type.
Can you rebase on top of the main branch?

josh

>  qcom/a702_sqe.fw          | Bin 0 -> 20388 bytes
>  qcom/qcm2290/a702_zap.mbn | Bin 0 -> 13804 bytes
>  qcom/qcm2290/adsp.mbn     | Bin 0 -> 12826756 bytes
>  qcom/qcm2290/adspr.jsn    |  21 +++++++++++++++++++++
>  qcom/qcm2290/adsps.jsn    |  21 +++++++++++++++++++++
>  qcom/qcm2290/adspua.jsn   |  27 +++++++++++++++++++++++++++
>  qcom/qcm2290/modem.mbn    | Bin 0 -> 8881672 bytes
>  qcom/qcm2290/modemr.jsn   |  27 +++++++++++++++++++++++++++
>  qcom/qcm2290/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
>  qcom/qcm2290/wlanmdsp.mbn | Bin 0 -> 3828228 bytes
>  qcom/qrb4210/a610_zap.mbn | Bin 0 -> 14384 bytes
>  qcom/qrb4210/adsp.mbn     | Bin 0 -> 13196348 bytes
>  qcom/qrb4210/adspr.jsn    |  21 +++++++++++++++++++++
>  qcom/qrb4210/adsps.jsn    |  21 +++++++++++++++++++++
>  qcom/qrb4210/adspua.jsn   |  27 +++++++++++++++++++++++++++
>  qcom/qrb4210/cdsp.mbn     | Bin 0 -> 3003924 bytes
>  qcom/qrb4210/cdspr.jsn    |  21 +++++++++++++++++++++
>  qcom/qrb4210/modem.mbn    | Bin 0 -> 8881672 bytes
>  qcom/qrb4210/modemr.jsn   |  27 +++++++++++++++++++++++++++
>  qcom/qrb4210/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
>  qcom/venus-6.0/venus.mbn  | Bin 0 -> 1794076 bytes
>  22 files changed, 306 insertions(+)
>  create mode 100644 qcom/a702_sqe.fw
>  create mode 100644 qcom/qcm2290/a702_zap.mbn
>  create mode 100644 qcom/qcm2290/adsp.mbn
>  create mode 100644 qcom/qcm2290/adspr.jsn
>  create mode 100644 qcom/qcm2290/adsps.jsn
>  create mode 100644 qcom/qcm2290/adspua.jsn
>  create mode 100644 qcom/qcm2290/modem.mbn
>  create mode 100644 qcom/qcm2290/modemr.jsn
>  create mode 100644 qcom/qcm2290/modemuw.jsn
>  create mode 100644 qcom/qcm2290/wlanmdsp.mbn
>  create mode 100644 qcom/qrb4210/a610_zap.mbn
>  create mode 100644 qcom/qrb4210/adsp.mbn
>  create mode 100644 qcom/qrb4210/adspr.jsn
>  create mode 100644 qcom/qrb4210/adsps.jsn
>  create mode 100644 qcom/qrb4210/adspua.jsn
>  create mode 100644 qcom/qrb4210/cdsp.mbn
>  create mode 100644 qcom/qrb4210/cdspr.jsn
>  create mode 100644 qcom/qrb4210/modem.mbn
>  create mode 100644 qcom/qrb4210/modemr.jsn
>  create mode 100644 qcom/qrb4210/modemuw.jsn
>  create mode 100644 qcom/venus-6.0/venus.mbn
