Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E86EB8FAF
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E391C433CC; Wed,  6 Sep 2023 11:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733F8C433CA
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693998837;
	bh=VA+KRdZ6Xu/+oUKfVMlzosWmfmKoCa2PZzYp2JsxjMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HNEWLdfbmqV4+nsIQebWRuuHy/98tNdtPMPdpWhAzDWtoqKgSna5g0/4fS+D3vNMK
	 GGE7x+mjYp7ezvtWORiBBGsK4v4mBPsM/IMl3Wqnu3xq4vqc/C6UazEcsFyQhYPT2y
	 j9QOxiOliHbsrJ/4Q/Oqr2sXtXqJ4VZb3zorw7v6wvswMlte/DdZhCyMUS2OWOu9xC
	 FBE9WJkDJftyNQ6pBie79ctJWzo2/o82NqI7w4KVBZXeT3XKDejvMd9nolU9a7AXRa
	 DxL79NjHYjd1qJSDY76khIJIn6StfabbZZuvQgwkdm2KX2MBNznzeW5W28J3ahuPmS
	 DL7U5zjPL6JFQ==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7b89ae27d3so3032009276.3
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 04:13:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YytlJe6u+J20+VM5WNY9xyhOQ8yohDJlq++E/lbJ1ruOcqqg7cX
	7IbP3vGYG9S4i+3pRirrn28ZjcVKDN+IhtOa1Xc=
X-Google-Smtp-Source: AGHT+IF8FeSb2z1O5NS7k0gnphlOLii3FAuyEYqRveRm5xG6GhzDLVi99cxDA+E6YATL+NfmEDEi2fyQe144YwB0fTY=
X-Received: by 2002:a25:d6d8:0:b0:d78:30ef:e9eb with SMTP id
 n207-20020a25d6d8000000b00d7830efe9ebmr16495279ybg.2.1693998836481; Wed, 06
 Sep 2023 04:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230906002107.1311378-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906002107.1311378-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Sep 2023 07:13:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA52gC0NYaC7GyddfOJ_jR2q44dq+t+Aa89B8+fxFvRMHw@mail.gmail.com>
Message-ID: <CA+5PVA52gC0NYaC7GyddfOJ_jR2q44dq+t+Aa89B8+fxFvRMHw@mail.gmail.com>
Subject: Re: [PATCH] ath10k/WCN3990: move wlanmdsp to qcom/sdm845
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Kalle Valo <kvalo@qca.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:21=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The firmware file ath10k/WCN3990/hw1.0/wlanmdsp.mbn is platform-specific
> (rather than being specific to the WiFi chip itself) and can be used
> only on the Qualcomm SDM845 platform and close relatives. Other
> platforms (e.g. Qualcomm QCM2290, QRB4210) are going to provie their own
> copies of the wlanmdsp.mbn firmware.
>
> As discussed with Kalle, move this file to the platform-specific folder,
> providing the backwards-compatibility symlink.
>
> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  WHENCE                                              |   6 +++---
>  .../hw1.0 =3D> qcom/sdm845}/notice.txt_wlanmdsp       |   0
>  {ath10k/WCN3990/hw1.0 =3D> qcom/sdm845}/wlanmdsp.mbn  | Bin
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename {ath10k/WCN3990/hw1.0 =3D> qcom/sdm845}/notice.txt_wlanmdsp (100%=
)
>  rename {ath10k/WCN3990/hw1.0 =3D> qcom/sdm845}/wlanmdsp.mbn (100%)

Applied and pushed out.

josh

>
> diff --git a/WHENCE b/WHENCE
> index 390a5689408e..7c3c34d51f53 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3395,10 +3395,10 @@ Version: WLAN.TF.2.1-00021-QCARMSWP-1
>  File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
>  File: ath10k/WCN3990/hw1.0/board-2.bin
>  File: ath10k/WCN3990/hw1.0/firmware-5.bin
> -File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
> -Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mb=
n
> +File: qcom/sdm845/wlanmdsp.mbn
> +Link: ath10k/WCN3990/hw1.0/wlanmdsp.mbn -> ../../../qcom/sdm845/wlanmdsp=
.mbn
>  Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> -File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
> +File: qcom/sdm845/notice.txt_wlanmdsp
>
>  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
>
> diff --git a/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp b/qcom/sdm845/notic=
e.txt_wlanmdsp
> similarity index 100%
> rename from ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
> rename to qcom/sdm845/notice.txt_wlanmdsp
> diff --git a/ath10k/WCN3990/hw1.0/wlanmdsp.mbn b/qcom/sdm845/wlanmdsp.mbn
> similarity index 100%
> rename from ath10k/WCN3990/hw1.0/wlanmdsp.mbn
> rename to qcom/sdm845/wlanmdsp.mbn
> --
> 2.40.1
>
