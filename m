Return-Path: <SRS0=S8I5=FP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,LOCALPART_IN_SUBJECT,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91F8C433FE
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Dec 2020 00:46:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F6F923DE4; Fri, 11 Dec 2020 00:46:16 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7C823DB4
	for <linux-firmware@kernel.org>; Fri, 11 Dec 2020 00:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7C823DB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-lj1-f173.google.com with SMTP id f11so8958628ljn.2
        for <linux-firmware@kernel.org>; Thu, 10 Dec 2020 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
        b=WWqd4F0EGETgFArsXDAFcxPg0XMQ+HOwpv7O40kc3nluV/bF9mIIBiW8+Eu0GMg+lo
         n8PSOfLmU3eZ3MsB4yUyMeT7S58MsYUDqfsVOWIUZGb3FE5EQGp7tZzcG20WDd0UCH2E
         DE8dURg+HXSDD430Z0yyeoNQ5LcKrgq19v+oKN4pjpei7j8MspKtF6iEs+i80Ieqtx2o
         ZJ9jPMhO7BwPvPN8kjSLYIkfKSlN7Pm9sMVGFklzKGdHRaCzUU4/ijBYSVOViyqR4Iu6
         yNFdw/q9aUN2T6X5D0I2I2+Pq9MxP82riNs0/u1CpDQTZfb8E2JbTpJI4KFlDCsw2olI
         MG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
        b=TF4+pZostO57sEpHtnyCGnv/Se+vy4sGDEZuE0wghNJpjzilGLqeSc8qL6d7B3WRBI
         KK+u0Aa90CFnLhbzEsF5apO6vlARxGBh26TBOvFlhAyRFp8ZGIWVLzd5CHMg7aM5oMme
         TR8ibN2yDnwfqg+mlbEbfANwRDx3VUFmy1wla7UD/IdWqK+VGENVNUAQxuJpm054wUz6
         /ysDUmE8dhiGKIIVeZEc7ifuK8S4N0nrTm7HvAGXgabaWYD1UKOK51ZEcuMZBqaktlNx
         nr2QpcnzeSIrLhrSCcTRj9U/qNITcFZb87PHjGOQ28ssBi2pB0Qpk5ijCJFBpN2Q4yE9
         5gzw==
X-Gm-Message-State: AOAM533/dmfDkdyBKLwS9C5MzZ7O6OPAPA91mo0E0UejnEuEpkbWpCOk
	PnULgp5SX8e5j6jRewrRpFW9oX+KxZnNbg==
X-Google-Smtp-Source: ABdhPJyfGzITQ3mb+eij+usHJPbNHtfUfmXccmO08xQzZQht6KMEH+jL6qM5c5dp4ugrWMhfPQcZ9w==
X-Received: by 2002:a2e:681a:: with SMTP id c26mr4091377lja.412.1607647574097;
        Thu, 10 Dec 2020 16:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.52])
        by smtp.gmail.com with ESMTPSA id u11sm694953lfq.142.2020.12.10.16.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 16:46:13 -0800 (PST)
Date: Fri, 11 Dec 2020 03:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: linux-firmware: add firmware for Lontium lt9611uxc DSI to HDMI bridge
Message-ID: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware lt9611uxc

for you to fetch changes up to 63ab3db8399a504048716eb3feed2867da58876a:

  linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge (2020-12-11 03:27:38 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge

 LICENSE.Lontium  |   2 ++
 WHENCE           |   8 ++++++++
 lt9611uxc_fw.bin | Bin 0 -> 17932 bytes
 3 files changed, 10 insertions(+)
 create mode 100644 LICENSE.Lontium
 create mode 100644 lt9611uxc_fw.bin
