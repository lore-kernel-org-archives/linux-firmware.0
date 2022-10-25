Return-Path: <SRS0=ynyy=22=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C79FA373D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EE97C433B5; Tue, 25 Oct 2022 21:48:29 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F3B3C433D7
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F3B3C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id f37so24779594lfv.8
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OYBGIfhY0JmbWcmbED3TnO1qassILcOzGujc3fEHgg=;
        b=GGIkZNrDc/rxeOI+AIfons2BmFhrL0cWKvB+hhOzdPmc1bEJoJ31CBp+cv7+vOAvcX
         zQCQ+RfB2YqRaBlmquee8HyHA3fXzDgV1Bznts7xWqyat9ONOqdFnTTZ+pKKlNkvfEBY
         fBPCYtgL0vDTHHGvMxqYE1Edc9djVrJGhs82ah83Q3qQMxHT0EiGB+8EY5b1LUS5OM6c
         Zw656Q1FiMfZYKsRBZPfH+jgNezpGrQbR7h4y8mVr23Pw/EtQVjX8EHAx21g/0pt8f/q
         gf7onFXVvtPGcXMjATw+uLip+u8OvzzmmlJHtntzTfxJxcFSC/qJVsHh7Uk5fFXr/OOc
         rh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OYBGIfhY0JmbWcmbED3TnO1qassILcOzGujc3fEHgg=;
        b=0lqI5BwEJcAdDPWiWk66Mmrc9jzVfC2iyBJZ50LreXNiexIhIZBzUOllyJYvLCVCLe
         Ux0/Vvbh+nBJ5civK/ffTCtkNAGNzMuK60tfE29wlQir8qGXWRzZLPEFNMLeOcrcOMYR
         O/J39NtdQ6OsmUHBVgF/pIcFopNNc4f7w/Niv85fYH58ucvEbZ1TL4zG/Sfgv0kXcm2H
         KaF96i4F9HR5CwYHI0OpGxeHHSczSS+aagoQIcj3BNWWS8gsxlbinvGz0sLsjTwxQb6Q
         9QqREx/THXNYj/hwV3bNtoodxmz6tvwVVgbCCZ6Psfsb/5RW6f2FAE6dIsF46qsg49yy
         pyUQ==
X-Gm-Message-State: ACrzQf2Rr510oI8V5oPdOCf6DekO5TkWCvb4gLzMpONah6koRJbfZ/Bv
	1vNfSA8UD50jTO8bwtw1+FmlZQ==
X-Google-Smtp-Source: AMsMyM4o9Ii30ktWU6QmKzIwavCyvoqeBWo3MELoOz6Zgsz+K3s3Fu4aOqcsTRcT/S6R+qekCqnoxQ==
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id f11-20020a056512228b00b004a23e534af2mr14283540lfu.280.1666734506321;
        Tue, 25 Oct 2022 14:48:26 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e7810000000b0027709875c3esm680386ljc.32.2022.10.25.14.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:48:25 -0700 (PDT)
Message-ID: <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
Date: Wed, 26 Oct 2022 00:48:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: Nathan Hebert <nhebert@chromium.org>, linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2022 00:32, Nathan Hebert wrote:
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> 
>    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmware_v4
> 
> for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:
> 
>    qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)
> 
> ----------------------------------------------------------------
> Nathan Hebert (4):
>        qcom: replace split SC7180 venus firmware images with symlink
>        qcom: update venus firmware file for v5.4
>        qcom: remove split SC7280 venus firmware images
>        qcom: update venus firmware files for VPU-2.0

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please excuse me for being too picky.

-- 
With best wishes
Dmitry

