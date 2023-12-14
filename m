Return-Path: <SRS0=ZYz2=HZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F46BC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Dec 2023 13:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16CE7C433C7; Thu, 14 Dec 2023 13:25:33 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 339DFC433CD
	for <linux-firmware@kernel.org>; Thu, 14 Dec 2023 13:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 339DFC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b9df0a6560so5587028b6e.2
        for <linux-firmware@kernel.org>; Thu, 14 Dec 2023 05:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702560331; x=1703165131; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eo7TGQBzn+xvDaIXlVE1yhtwxZPi3kc+TmPKNu4tZfk=;
        b=qmpHMRDIh5qkXs3i0vh9dtU201LCnseb/r//jDff0Spu2JETqI8lzsur0xxVGJNf+H
         PJHDHBjSS23vPyW93AiQYWqlwyu7av04z2DmWGvNk9tir8OJ8Yhfzcr4xulUIwX2vLZP
         iwc8QbRNSVbZQ0kSJAhXPzkgjFe7x2NeCRfbfEIof8gD9WJfUle/i9ebCqOHBz2o6poo
         /YaYhEL4iUe3n0iPzCPP7GQPKFtAJPCeQnbJiGfuey6HPYfd2qJK5wzWiZMNIwd26Iy9
         8YPy1H7FUrS88jVrWXB9YV08ks0shK2uO/GxxvV1fW8C5045hLPN/elbx4iKfP2/qErv
         a4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560331; x=1703165131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo7TGQBzn+xvDaIXlVE1yhtwxZPi3kc+TmPKNu4tZfk=;
        b=EfK0yBRI6GS5DGEQoGqG4SZcM4utlA+Ehe1VG8pkKfrVyJ+NR3pwtJq1fcGDIzMlJi
         7onY0UFcXK7s2uD+rqMHOAz9Rfr2nIxetxYxAl6gddB3hckz0jPtnXwQJI43acKomNZi
         J6B0/rIY/wu+m7Ho9AR3A2p/OJdjOfb6rKBL1myHSf9HaL8FyPiQnp6EB4LsjU/cR+jF
         1FiV0sd+QqokrepomSimINiB7rdH+5D0K6WQTI0MVxc6lfVgQTPEHVHsdUzlfW0DTsjG
         amH8+2/3CU4RTgBbEVY62sLOb5lj4mS15QH9i7m+Dp7zXbPLtdMRtgYHrtOZTcDqnAm/
         E9+Q==
X-Gm-Message-State: AOJu0Ywn4BkPOyhMfE7zKNn5LCSTyWtOADZ0eQ6WSEq9aBfZOoLi3aDo
	O+6d1j1RN8g4OTiWUv7G2b3GmqVvGylEJLwO5QGwpA==
X-Google-Smtp-Source: AGHT+IFzdyL1hLeqb8Sbzc8WcBydPWEyXrbfKDtVNXXVr3Jq/fC9bOiQavMRKtNc8m4GTFyYjRL/EATVRO2Y28yHMBw=
X-Received: by 2002:a05:6808:11d0:b0:3ba:1309:4375 with SMTP id
 p16-20020a05680811d000b003ba13094375mr5150407oiv.57.1702560331209; Thu, 14
 Dec 2023 05:25:31 -0800 (PST)
MIME-Version: 1.0
References: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
In-Reply-To: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 15:25:20 +0200
Message-ID: <CAA8EJpr-yQyqEFGpo2hj6+s4z+W=gAFns=19=6p52wDphi5ThQ@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 and
 SM8650 QRD platforms
To: neil.armstrong@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The following changes since commit c52dc2526009abe1a685f190423f605c01ac1b86:
>
>    Merge branch 'mlimonci/missing-dep-ci' into 'main' (2023-12-12 11:56:26 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-sm8650-audio-fw
>
> for you to fetch changes up to b80907ec3a811aff9afdeceb7410ad408f7e0de4:
>
>    qcom: Add Audio firmware for SM8650 QRD (2023-12-14 13:22:35 +0100)

Acked-by: Dmitry Baryshov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
