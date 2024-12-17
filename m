Return-Path: <SRS0=2557=TK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4D3E7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B6CEC4CED4; Tue, 17 Dec 2024 10:42:14 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39E2DC4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 10:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39E2DC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e46ebe19489so2092023276.2
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432132; x=1735036932; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=51uJIXpUfFnVo7MBIRr3t63/q5dj04h9irCtAI8LVXo=;
        b=xAW4MI/b3jpmSAoTKMcCZ9HJ3lfcOAOW40BtRZcvWGRFxC2X4ceGFAdD38U24FCJyb
         ILIDXu0cNAG/sEPmNC+Nzd/1dUwUruWrt/F7T7R4oWokt5uNXhc9u9SbahZhLV0GZhTF
         NVkDgXSxSDjTo6NgYFBCAe5BYpwpaei7IUOUed2JdDGLhbFgBpO/OZMFOT8wFPs/YR54
         x3zrYtORGJKnFb/omgvdyE08gX4wvKMqutkW3u7xRJbw///73Gdx1Yh25hYM2DJ/5hT5
         y7wab7AswtW2rMTCmR21OKUmvvpJ/2zI0ZAfLhNMX9ErgD6jqEv9kH1SdagrHXQI0s2Y
         3MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432132; x=1735036932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51uJIXpUfFnVo7MBIRr3t63/q5dj04h9irCtAI8LVXo=;
        b=Y/rXqK7V1WFSueQpgdat+Zs1+kuz7bv20rhlmJHYcMF4V5CktU3uC5uC1Pf9xsmWtn
         HwU1XDt/QS2Xl0YXYm/MLHnFetJ/2nB1IKOmBmW2TDCMAWP+Gxkk9PqIsh0eO3to8SzY
         tDuwYzsLDYm30d0xr12HyxDj05FD7Jp2iE5EvKqqwjUrRbxMvgvtsc5ym1dpN4gPQbDd
         PGIyuf4bPktNFNiHs9f6CxafqIXa5J8x3AUL+h4X7DkBBm+YdYZaHh2EaQzIZlHk3ABu
         Xzva09VCzvxMdDRnQYAUZzIEGmOlLswFgXp0UU3Pg8zxE4sODsFHwxrbK9kFNg8ZjxvM
         1aOA==
X-Gm-Message-State: AOJu0YwwbWBefCMLnzkQ6XutkCSWObtyD05kv/TECYoCi5iJagyVweyj
	Z83zm+VgZYAOjQdq+k2dC8DZuIYK6DScOdb9Y8R4XivcqY5GQa2wG7D6A1JfTmWvVofcbTHn7Zn
	2HBpMfHAb/lviHc6rhi1Bg2IBRnNWimRkk7+XzN941LDWMsJZP2Q=
X-Gm-Gg: ASbGncuRCRNlbxx67Egjv9GjOkYNlySRbP7yNAD0dEtONhKa1dgNZL2+YLJQZkxf1AL
	12kcIZ8fTmSQOdrMWAJMV3j3Dc/Afnqaqd+BNSTB/FKESAw0+XCa+
X-Google-Smtp-Source: AGHT+IFBzusJWmQNhvKHvEqXYfXypxRtlG2uCAWL1BMOAFMt4jolg6zbrNzOFLjWJFuL0bCnI2F9Znc5zjzhb4eLypc=
X-Received: by 2002:a05:6902:1542:b0:e4b:f516:38ba with SMTP id
 3f1490d57ef6-e4bf516431amr6539748276.17.1734432131886; Tue, 17 Dec 2024
 02:42:11 -0800 (PST)
MIME-Version: 1.0
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
In-Reply-To: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 12:42:01 +0200
Message-ID: <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com>
Subject: Re: update firmware binary for sc7180 and qcs615
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dikshita,

On Tue, 17 Dec 2024 at 08:10, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hi Josh,
>
> Please pull below change, and as discussed, skipped creating symlink for now.

It's sad to see that this change wasn't even verified:

$ make check
[...]
E: qcom/venus-5.4/venus_s6.mbn listed in WHENCE does not exist

Not to mention that you Josh nearly asked to add the symlink in his
response: "...but you likely want to include a symlink for
venus_s6.mbn ..."

>
> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
>
>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SC7180-QCS615
>
> for you to fetch changes up to 07479dbb62054d362a206e71c2e4cb52181c81d4:
>
>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
> 11:36:00 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: venus-5.4: update firmware binary for sc7180 and qcs615
>
>  WHENCE                      |   2 +-
>  qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
>  qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  delete mode 100644 qcom/venus-5.4/venus_s6.mbn
>
> Thanks,
> Dikshita



-- 
With best wishes
Dmitry
