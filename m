Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1291AEB64D7
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Jun 2023 15:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C114EC433CC; Tue, 20 Jun 2023 15:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA163C433C0;
	Tue, 20 Jun 2023 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687276210;
	bh=fCHaEXWyC6fWILU6XCB3eSccz58L3tCkWUa0iX1sBD8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JXdrQS8CqsdCypRLZv8Wd2XEz7OqvnVAi1sMlKWQxx0Vze6T+NLA2vdCUD4wgb8FZ
	 Sxe0DCkKTKqEIf2d8txHOQB2maU5u+0a2uvXj2KBYgdicnQ37XrOjyp+i9MZ+9dQVg
	 9l1m02hLBavIKM5XJeYZZcFpnjcbMTOCP2oY/ZwV4Nbrr9nZnfl4PPJXJi8/6vw1Om
	 qQ8bH3cp5FrZtO4BsYDQwqnFyJF1F+S65yNfrSPoFUymG/W6dhn8O1n4E/IbESW+Rx
	 /H9teZU1WliS1mfagVJFfeFNMP7kADcGHHTePfC1ABjmBZc8qtecY294at0awrlokN
	 cGoSnq3XOaabw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5701eaf0d04so51058317b3.2;
        Tue, 20 Jun 2023 08:50:10 -0700 (PDT)
X-Gm-Message-State: AC+VfDwL7v85rUD+gzXrP8iN4UpDwoGYf6GFWExNGTa2C3ZOWIa1JKUI
	ZpJfZjywwfMwvgc3kWjwYRTl/dMJfIs1OaZtVN8=
X-Google-Smtp-Source: ACHHUZ5RfZQGiKK5q4v0X+eLst6wDVYP8TKJG5IbdKpNutVEahzQ8qm+Tz//pa/QoES6CL43gatyLHa5j588tFevl/g=
X-Received: by 2002:a25:2f82:0:b0:bca:3465:9ea2 with SMTP id
 v124-20020a252f82000000b00bca34659ea2mr8707373ybv.48.1687276209725; Tue, 20
 Jun 2023 08:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230614085950.238378-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230614085950.238378-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 20 Jun 2023 11:49:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6ft66VZNrgMLh7CZB3qdgQWFaEwg6QinRJ7FdwvLZkLw@mail.gmail.com>
Message-ID: <CA+5PVA6ft66VZNrgMLh7CZB3qdgQWFaEwg6QinRJ7FdwvLZkLw@mail.gmail.com>
Subject: Re: [PULL] Update firmware for Qualcomm SDM845 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Amit Pundir <amit.pundir@linaro.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 4:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The following changes since commit 1cd1c871c9162a2c34380e6dd0c8ac9474d365=
22:
>
>   rtl_bt: Update RTL8852A BT USB firmware to 0xDAC7_480D (2023-06-12 07:0=
8:48 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb3-update

Pulled and pushed out.

josh

>
> for you to fetch changes up to 01a7a844cda3009327145d117844fd78bf01011b:
>
>   qcom: Update the microcode files for Adreno a630 GPUs. (2023-06-14 11:5=
4:16 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       qcom: sdm845: update remoteproc firmware
>       qcom: sdm845: rename the modem firmware
>       qcom: Update the microcode files for Adreno a630 GPUs.
>
>  WHENCE                                  |   7 ++++---
>  qcom/a630_sqe.fw                        | Bin 32056 -> 32304 bytes
>  qcom/sdm845/a630_zap.mbn                | Bin 14256 -> 14256 bytes
>  qcom/sdm845/adsp.mbn                    | Bin 10420560 -> 10425168 bytes
>  qcom/sdm845/cdsp.mbn                    | Bin 2704916 -> 2709012 bytes
>  qcom/sdm845/mba.mbn                     | Bin 242400 -> 242400 bytes
>  qcom/sdm845/{modem.mbn =3D> modem_nm.mbn} | Bin 5652688 -> 5673184 bytes
>  7 files changed, 4 insertions(+), 3 deletions(-)
>  rename qcom/sdm845/{modem.mbn =3D> modem_nm.mbn} (73%)
