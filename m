Return-Path: <SRS0=6loB=RG=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E45CF11CF
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 11:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDB1EC4CED0; Thu, 10 Oct 2024 11:07:33 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C114BC4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 11:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C114BC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6dbb24ee34dso7042357b3.2
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728558452; x=1729163252; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MV0B3hmGYPJhgfyzR5vKSK2lif5uRpS+pqTEpDHbvHQ=;
        b=LFvvZ+njFWQpod9ErDZLetzYrugWufp7ft1RrCZSgGq8NknwfQAR+cPtlujnBqsGpC
         qNQ91Qa/fNQeik+qOm9GSwDJn/QekB8cEQsiWqNMkdOLy3Zx1fkS8YMjMPxA1vr5NN8l
         CKp4b6RX6Ilc0wUV5R/jK1I/+27wm/uBot0hZ0DUiOCRmfttSlBpgg8ccBbNBv3WSjZL
         e9Z0eUjXI1cEAchdLPG73Qln0fZlaPbY4o6vVTmiK+skrA8fh2VfBCj0lkYMIp64TrMD
         gZvqiVJBaJlxl+9wGA3vmRAPyfoToWwuPjD7Ic0DTD2fUVHCGmB0lagui37JsWXqNeFZ
         1Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558452; x=1729163252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV0B3hmGYPJhgfyzR5vKSK2lif5uRpS+pqTEpDHbvHQ=;
        b=WlJXyoseNDhI+Ea5fLVevnve+d9O5Q9YXxpg2zjY91oYqcBaZXbGcmfxOhweDu/lpy
         LHhIVSSIkMKOYu7LvMJcZtguzMnT9leTPU6hcfQR/fgUpc4QNEwy+rltAAIbledibbis
         R0q9+bC0g/jUYcnGEkh/Dj163GV+NuLlhVOB4dUZITwbOFOHe5clO69vIJbV05Q9bPAE
         FgcunA+SUSsfmHUJ1Kt7x/t5P+zunIraiKERhbmbtFjP6MRDjKKTMVANJV6MBDYE67oj
         U3nq93C/ox5eosfQ3XP/3XNFPjbbv5iCRPOkHaZ3CDAQ/fHcpAnueXuplnXLe08SZTgx
         14Gw==
X-Gm-Message-State: AOJu0YwTqJBbkxKlJR+Jj03eCptvv43h3Gmd5iPSbhzNtA9I62lpF3w2
	zWN+rB+QuGWBbqfvo1gP8Ijiljokm/+oqp6eQt9bGZb/UD4nYHdzlBiBu1oGY3W7NhS69yiG3Jq
	yqxt035E67J9vRoGD5zlAhD4jln8iC5f03iR8xg==
X-Google-Smtp-Source: AGHT+IHsTFyIIZk3lKFzeMbVsIpssCe9vtclLBP5PbPDq2wuCNXOoeeKF0CTLy+ydgV68d8c4Zw9aEICmnn35znqUSQ=
X-Received: by 2002:a05:690c:2fc1:b0:6dd:bbb4:bcc7 with SMTP id
 00721157ae682-6e32e44eae4mr28906027b3.44.1728558451733; Thu, 10 Oct 2024
 04:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>
 <sawsdn6kvjymvocnrb2t27o6qcuj2lpctv465plzfq7io7f23u@nmck7rrgvdbu> <0375ab16-8f0a-4520-9073-13dfea660f30@quicinc.com>
In-Reply-To: <0375ab16-8f0a-4520-9073-13dfea660f30@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 14:07:20 +0300
Message-ID: <CAA8EJpoFumfn3b8FhV-AsbPw-dcg5UsSS0eEsG36p0YuC+69xA@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmwares for WCN785x with UART transport
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 13:18, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> On 10/10/2024 6:00 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 09, 2024 at 04:30:34PM GMT, quic_zijuhu wrote:
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know if
> >> you have any problems.
> >>
> >> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:
> >>
> >>   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/zijun-hu/qca_btfw
> >>
> >> for you to fetch changes up to 2a8ffa36567f300041c6d6d509b897a4fcc42916:
> >>
> >>   QCA: Add Bluetooth firmwares for WCN785x with UART transport
> >> (2024-10-09 16:01:30 +0800)
> >>
> >> ----------------------------------------------------------------
> >> Zijun Hu (1):
> >>       QCA: Add Bluetooth firmwares for WCN785x with UART transport
> >
> > Could you please confirm that the licence for these files is
> > LICENSE.qcom rather than the typical LICENSE.QualcommAtheros_ath10k ?
> >
>
> Confirmed that it is LICENSE.qcom

Thanks for the confirmation!


-- 
With best wishes
Dmitry
