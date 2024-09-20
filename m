Return-Path: <SRS0=on3T=QS=gmail.com=sahinalom28634@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E05C7882C
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Sep 2024 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05DC1C4CECD; Fri, 20 Sep 2024 11:50:22 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FEC4C4CEC3
	for <linux-firmware@kernel.org>; Fri, 20 Sep 2024 11:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FEC4C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-206b9455460so15214635ad.0
        for <linux-firmware@kernel.org>; Fri, 20 Sep 2024 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726833020; x=1727437820; darn=kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=WMUnUD5DuVMgiG715HkoZWD+7jWlrq7DqeV3HY3aFTvM59SuSawff8ncLLAp4R/4Fs
         5dyZ2SUOEU9+0z8kQOX57Zy38kFznSTovT7XhDyqpXqU25+V5gA0hihzeOJhWUlu9PtC
         xjG2u2iy8gmP+DUkC07SIdXxJScKvBnXBPle5GrdoCNOzT0hFhpzA0AjySn6jOmTPZMf
         6njujBDyupU14gHM1fJlqG90Po6ye8LxadGpJ2KeGM5SHLdDJimfUijPTDp1hkmf0lq7
         +1gFvHHG820Fqdw7oDMjLA5OdBdN93vc19BJLFojrHeMsy1rm4tKmuaLl8cSSRduBdrn
         YE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726833020; x=1727437820;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=rS66L1AL5T8eN9QeyUm9iUDZEcYwKz7bsQlHXDkUqOQbEwOjuD5Vb7EmNI24qkPf0j
         xjvfo42YKmGdkbNMxh+f0nSVvDEiVi3gEJGc88xceIGGOLemMIZ7YU6uPhzjc3217VM/
         UElFaf3AUhiqpNqiCLxGt2uqPN1/bfMEL5x9iu9tvdBpYMl5hiClHKQYqtl0dYkNajhz
         TMB91FbExH17HH07ttu0HKeIS2EMVFieyOevxAv8paaWSEYGbefG+notY2hRRGNl2Eny
         djYhjbW/nSDj3zd/ACkyLsVjeDDIVGTFo4hM1wQKy4HV4UHJa40SR8EdWjWTmCaJBUFb
         NaNQ==
X-Gm-Message-State: AOJu0YxpNtD9JS17gW/LcOiX7MVeof3rjPhgKY5pkajAyfu8eB8jooZ8
	H7khZSh9TkTYhoQ3uztW0ayB3fpNYk28T05gZfcY8J1PA4U38v5PXzyuVczL
X-Google-Smtp-Source: AGHT+IG/vzP2MmafM1FieXzc5ouA8sxiT70s/9WoRukGaA099QABHd0w4SOek/z+706lZFFbUHibLA==
X-Received: by 2002:a17:902:d2d0:b0:206:b5b8:25dd with SMTP id d9443c01a7336-208d785473fmr44934945ad.23.1726833020139;
        Fri, 20 Sep 2024 04:50:20 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794748053sm93441275ad.289.2024.09.20.04.50.19
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:50:19 -0700 (PDT)
From: Michelle Fangman <sahinalom28634@gmail.com>
X-Google-Original-From: Michelle Fangman <michfangman@outlook.com>
Message-ID: <a62c8b4e5a4d97b89933655ef24fcb5a4d2c6aced3308759d1e02adfde2a6339@mx.google.com>
Reply-To: michfangman@outlook.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Baby Grand Piano  09/20
Date: Fri, 20 Sep 2024 07:50:18 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast who may appreciate it. If you or someone you know might be interested in receiving this instrument for free, please feel free to reach out to me.

Warm regards,
Michelle 
