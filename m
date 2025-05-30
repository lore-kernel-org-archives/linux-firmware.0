Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB561C5B543
	for <linux-firmware@archiver.kernel.org>; Fri, 30 May 2025 11:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3D3DC4CEEB; Fri, 30 May 2025 11:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC57C4CEE9
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748604885;
	bh=epeLKDi5u40E/4RMNu1NkGW4AsKxAXtfgMK0kqbjJ6A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=evnjqmlFvsTln23JWyHQCXlWq/zya4W2vfL+JyS0OjUbXR2kufqs/tfRjry39yOIe
	 ucW1/PYBgtnfm3iLIAYM9Pvr1K6Zpqs6P2KX4zW3gwLzU1XXkITNrhobcrEznIcV4M
	 TyolnuH7mW0NOwwKhS/hR6JTkcVe1axTmNMl460JwvhElG70blI8R3b2PQ+ZwGbya3
	 WVsXsNQoHfj0Bh05Lcq0nJIJFo58ciUVJfou1fQJtE0wU29knJE0IidUFW5wmX0JO+
	 bDq8386pQ6SYKR4iepbfXIe8AmSRkXJciFBaqeBvBi1MA8FGqz51Xs8Jr4Kt/Q1GYw
	 oTz1K8lpnqgDw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e767ce72eso19851967b3.1
        for <linux-firmware@kernel.org>; Fri, 30 May 2025 04:34:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz0+bn97tICCM4Nf1xPho2fubb6DD5o4BbqZdlPpqM+8aQ9Qgwg
	yz1whJZ9x7pnlf99NCvdBjqBohrEvwcV733fXKFPXpaGs2augrx+FS8SShSRvB4M1+qtBfCwjMV
	8Z4JiCka5TwAFYKW+lpnafU8hqcVufAU=
X-Google-Smtp-Source: AGHT+IEoV+NkFW42XtFHk7n+y7hVNS/3xVD7tetnU4J+RAsvdFFVBBDRpTYQsyoBIz9kdB1w5MZdGkITYpEGDhoDJxw=
X-Received: by 2002:a05:690c:4681:b0:70d:f35d:4d26 with SMTP id
 00721157ae682-71057cf7ab2mr22212177b3.21.1748604884978; Fri, 30 May 2025
 04:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <7fc47d8c-36c4-4925-930d-67472cfb0796@oss.qualcomm.com>
In-Reply-To: <7fc47d8c-36c4-4925-930d-67472cfb0796@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 30 May 2025 07:34:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4MToX9tXkjmR+nN5bdA9mTi-Ltjqy3CDcGzRDUiQp7AQ@mail.gmail.com>
X-Gm-Features: AX0GCFt5C8X5pi6tRqLK-nx-DxaSnAH6VlekuxH8DNGuZSJ0ZqZraAfShdklPfs
Message-ID: <CA+5PVA4MToX9tXkjmR+nN5bdA9mTi-Ltjqy3CDcGzRDUiQp7AQ@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCS8300 platform
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com, 
	quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 5:24=E2=80=AFAM Viken Dadhaniya
<viken.dadhaniya@oss.qualcomm.com> wrote:
>
> The following changes since commit bc0d1ef315fc5a71440a0dc3a00cbdd7daa3cf=
5c:
>
>    Merge branch 'robot/patch-0-1748572750' into 'main' (2025-05-30
> 04:26:50 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-qcs8300

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/571

josh

>
> for you to fetch changes up to 7143ab41c85907254d5c4fd0e7d987b50e7a1b71:
>
>    qcom: add QUPv3 firmware for QCS8300 platform (2025-05-30 14:33:19 +05=
30)
>
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>        qcom: add QUPv3 firmware for QCS8300 platform
>
>   WHENCE                   |   1 +
>   qcom/qcs8300/qupv3fw.elf | Bin 0 -> 55541 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/qcs8300/qupv3fw.elf
>
