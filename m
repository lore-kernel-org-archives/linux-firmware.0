Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D5EB8FB6
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D026BC433CA; Wed,  6 Sep 2023 11:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61E6C433C7;
	Wed,  6 Sep 2023 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693999146;
	bh=XS6jwmse7EVTfm8oBzDE4bTR+j8NBQlGXxeuDURLHtU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Y1eE8EyIyEprrNK+FTToljbngVjztaGXeTXbVKlISBanz1jbyRpsJZJJiweT2LDgm
	 I47yCIwUTXrg3JqaYkx61si93NOeka/E7E5pmOrGo3P8hYrC8FDTCZxPpG6s+u0eJf
	 50bFI20dicYDjifGvhlZi4rJEAIqJQN88zS9WmHuN5hse78sMHQF7hjXqg/XUDX9GX
	 9jZYSPASu7VG7R5l73fsAVo58H8A1SHRJ3Phh+RcaJVsjPJx7+ITcAiinaXFvm6G1p
	 68DLt0SD+H4pKjaloFe5CaM6EN2adev8dNx1S2w1t3r93GwCpWreSauFJ1XLu2yc5g
	 3pvCbRFwzS6LQ==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso3129391276.0;
        Wed, 06 Sep 2023 04:19:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YwvgrUfZ6ZmWPNIhQIGAt3rDmlBugU3rv8hbIHixlRPeTd9iuLv
	IDQtzPG3JTQFgvv/MCodibkGugqSPiwQ9WtL9ZQ=
X-Google-Smtp-Source: AGHT+IHl9zw1zxOV2EOJhqegM6ukGlR45czUvb8wBG2DYsa+mnva8pOE5RcuCdC4Ue9mx5CV6uBtv0PP/PM9SktgIdI=
X-Received: by 2002:a25:ef0a:0:b0:d78:3047:62c6 with SMTP id
 g10-20020a25ef0a000000b00d78304762c6mr14932749ybd.21.1693999145713; Wed, 06
 Sep 2023 04:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Sep 2023 07:18:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
Message-ID: <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Please pull in firmware updates for the Qualcomm Robotics RB5 platform. T=
his
> includes SM8250 DSP firmware updates, video encoder/decoder (venus.mbn)
> firmware update. Also as a part of this update is included the board-spec=
ific
> firmware for the Sensors DSP.
>
> The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8dd=
b5:
>
>   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2=
023-08-04 06:33:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb5-update
>
> for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53a8:
>
>   qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       qcom: sm8250: update DSP firmware
>       qcom: Update vpu-1.0 firmware
>       qcom: sm8250: add RB5 sensors DSP firmware
>
>  qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
>  qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
>  qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
>  qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 bytes
>  qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 bytes
>  qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 bytes
>  6 files changed, 42 insertions(+)
>  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
>  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
>  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn

This misses WHENCE entries for the new files.

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: qcom/sm8250/Thundercomm/RB5/slpi.mbn not listed in WHENCE
E: qcom/sm8250/Thundercomm/RB5/slpir.jsn not listed in WHENCE
E: qcom/sm8250/Thundercomm/RB5/slpius.jsn not listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you rebase against the main branch and fix this?

josh
