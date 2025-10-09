Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB86CCD184
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36612C113D0; Thu,  9 Oct 2025 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2119DC4CEF8
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760020237;
	bh=/4Iscoja7nftkILMU6Exq0bAoEOcMAq2+Xkg47iYpkw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MJmocZhHLOdtzkw73KlfrIydkrMQ6NREs15Y/MTaYwpdDKTVPxwR4I6j+AQTsHZds
	 RlvmctJgvnZemlahoAuXLpiLT8OEoxYtAt5ZzO5eqRhpccrT5DMvtEPCYLQMsP7G0z
	 fPeoL0TA9+BU498b3sy9fjXhueUqaPgNLIJqgn8YeTsix82wwY3OBaylwI3Mt59rkY
	 aFC9YVXVCmYcfGetfuWMF3ZgPD2U98KGR2CyUNCrskE0U6wNAirq74iWtkIb6wlArW
	 kqHYDeaI+ucXL0OPSggzndgO/tBv/irhQJ1GGOXFvd4e6Rh3HFwQ/45aujLPFWh73F
	 i0z7TpawXxx/Q==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6361a421b67so1123159d50.2
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 07:30:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxksn7BEExLC/Oa71rr8rDUxUgWTi6oSzN0ym26MtO2QV2432of
	8gDfHvtFXSldMaZUmH1CymuizEHiJapd0pIwqjRe8r0Vs3ntSeeyzebij7a69Q4jIip3mS3Pkcx
	CjTtZdA4V4tQGQZrfkqCTqEUj9hBtmBA=
X-Google-Smtp-Source: AGHT+IH/V6rrLlQNrVloMdVO+fPcpGEMHiyuRadTCgBnB/gPtGxKJj9xe4ukO9mT9n3Qlv3/Trkh9YmRVjv0iRNEps8=
X-Received: by 2002:a53:cbc4:0:b0:636:d625:2bc1 with SMTP id
 956f58d0204a3-63ccb86074cmr5214007d50.19.1760020236299; Thu, 09 Oct 2025
 07:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251008224458.73348-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251008224458.73348-1-dmitry.baryshkov@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 9 Oct 2025 10:30:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA46OhShGZBRzvBTmTo4OingvrTWhRoqpRcW7x+rvUC-MA@mail.gmail.com>
X-Gm-Features: AS18NWByCzKAnV0KLuTUWGSAOIC_A1-2VVSrVISWzJY2X00Rqu4dBrVgnGCpdm0
Message-ID: <CA+5PVA46OhShGZBRzvBTmTo4OingvrTWhRoqpRcW7x+rvUC-MA@mail.gmail.com>
Subject: Re: [PATCH] qcom: add version for A650 GMU firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 6:45=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Add version information for Adreno A650 GMU firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/728

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index b74af1bc1fbe..7f4042afb3c7 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6481,6 +6481,7 @@ File: qcom/a630_sqe.fw
>  Version: v2.07
>  File: qcom/sdm845/a630_zap.mbn
>  File: qcom/a650_gmu.bin
> +Version: v2.1.8
>  File: qcom/a650_sqe.fw
>  Version: v1.12
>  File: qcom/sm8250/a650_zap.mbn
> --
> 2.51.0
>
