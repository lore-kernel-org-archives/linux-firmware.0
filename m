Return-Path: <SRS0=d82z=7T=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F524D31A26
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 08:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17586C4CEF7; Wed, 14 Jan 2026 08:27:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B7B8C16AAE
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 08:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B7B8C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j3Gs2346642
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 08:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPB/c/bwICUTH/W1SLH3jFpE
	2mn6yMg2cokKDnZfXyc=; b=cpf5TyQD+CqCVZMmGxMuVNi4e+Q6WnExkWvzqkEL
	CPmYNiDTqqEBZoLGqvLAMYcS1Nh6oezl5yXYTgdtkVFoorCE08rVyQmEuJGRkSSf
	bN4rspbSp3/wjpQgtFbuQuC3Lys/s44pdTKRRuDgmXR+kBGTUKPsOUYzycwoeRKG
	Id0yVaCwZ1En5xEpdwYOcEWSrX//M3kAQmsOevI0nce68diokz1oNpLfNnZtb4HK
	9BPiZ7hNL8bbkM+uKy3YC5aCs1JL96PREf0HMPE5TDdfk6lCOm6UNMB6er0Gj0MP
	mN8LZuk0zzVGLlQdgyrD8hVtgG/Qcertbuuvl8RShgzg8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dv396-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 08:27:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso171253885a.1
        for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768379238; x=1768984038; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPB/c/bwICUTH/W1SLH3jFpE2mn6yMg2cokKDnZfXyc=;
        b=CpQnkm7EQA0NZEZCcd370TNQ71X47MW1y8AdZXTWBbZEKqYaFMYfn5s5oMGcnjoXQ8
         69wNVV97xaAut1GCQ3dCGnKXO9dUVlE08NHciSFQeTQ5Zr1YtOY7+4XpG7YrrRFeISZ4
         fBytlwMfLmsIlKibg/yGvMpyBiU53Zh55wK4TJTUhwWmKXV+9SQj+k0slDhYfO+QnWBw
         YJlE4EHvmM1kaC+TD0h0xxYHSRCH+/RgcZnetkEXBWET4o96E1jTaAPJcgikFyWWtxyN
         E3ZDjIyTLUHrzxaylJfR4/1iue107kI+EuG3CJzJWh59DTnWewwI8EyVPy5RS8AdiVwj
         q8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768379238; x=1768984038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPB/c/bwICUTH/W1SLH3jFpE2mn6yMg2cokKDnZfXyc=;
        b=pJLWDNslSQWGlIeH2yvJIUfxk0j61ZoajqE08oXwAE1OOLNf2+1SO7cpO9LkGpROWE
         Y51Qne5mCUl3Kx2OZpntwXsZzbV5vtcPSheJSl1/WjVv1gSanSZKsmTzooh781oVoIXa
         Y9ktOQVIggR2qlK4JXWVDOVBLJzColNXodZ5tisMloQEVISEQrK9g3jHEr1eRyNZrJVy
         mc4yN365+dcMWXA0+vV66ziyVC0az0fTRSSCC7kJLHDJfBR+qarM9nGxwVmWaigE6L9k
         QRFILmkd66A6Mq8k/tM73DgKgx1vKAzn/9P8SDjBFggLXLOt7j9FlKKZicmcRIFlA9Bf
         Wx4Q==
X-Gm-Message-State: AOJu0Ywwce69IqzFdMvM0hTVaEtB1dcMzJ6y5G4mC0WcQmWjCCk+hB/G
	sZM2VQEJhxunBB3g8K/xRxTgdhl7GKOjTNB588AXN7yV9y0gDZw8raa85H8U+j73hL+GUYZ7bK9
	t+hUnukP2JNdWGOGVn0LPffP0bjqtUuO0bFZdcxyinsQfjiIkegkFjgqDn//0iVA=
X-Gm-Gg: AY/fxX5tZxPjPomE+6/5NNyxEv3rSrMBMDtRu9NkRJ3jf1C3fL64JHlZ/IXf+PdcmS0
	/hHbkBOD8qiNcGUP+YEzzWHYMjULrjUgvhPxMdFW9fmt2lwRrUUbkboZGN/8WRr1gTSjBr3xsqH
	WPK4tLlHlsrOm8GpzESmYwDb2n6h4gTIe7fdhmbYMc2atzfZdDzR9fLR3V8PhJ2bLHquUL30sq1
	GluJ8lj5BPxVhzwduGP2DVH8dcjKrwZ1tSwtYv6QX7xjqUijYMxtEIZT12wtCGCH9hJEfuoat9X
	ETFHtAfsYaJ3wbOGkiFURRqm0hLDZr+VCOpJ/aJvIeESQvYJ+vozNhciUjhHWuT3+sorJjvIKn7
	KOYOhvBsWRtYRTotthNf4AWCafVMe0m94ZzvKz/MfBENNlxA/HozgLhVufgde2h3sP1fOvlQ++A
	ir8rVeKY2k7LMJLUHZcr9GWJQ=
X-Received: by 2002:a05:620a:1a9f:b0:8bb:6a17:cd62 with SMTP id af79cd13be357-8c52083a633mr732317685a.15.1768379238192;
        Wed, 14 Jan 2026 00:27:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a9f:b0:8bb:6a17:cd62 with SMTP id af79cd13be357-8c52083a633mr732316685a.15.1768379237736;
        Wed, 14 Jan 2026 00:27:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb90a4besm44790211fa.41.2026.01.14.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:27:16 -0800 (PST)
Date: Wed, 14 Jan 2026 10:27:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: [PATCH V2] mediatek: rename MT8188 SCP firmware
Message-ID: <ybxcmmbn725wwh4gx222lzosyklp32rrc5tzspczqnkyob5wzc@lmvexbvibp6z>
References: <20260114072433.3076970-1-moudy.ho@mediatek.com>
 <20260114072433.3076970-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114072433.3076970-2-moudy.ho@mediatek.com>
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69675366 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=0SH4ZisJB3LRqHAEhD0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RH_ukGRi7M6KsrOU0Tw5M41feGjInEI0
X-Proofpoint-GUID: RH_ukGRi7M6KsrOU0Tw5M41feGjInEI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA2NyBTYWx0ZWRfX7+Rxww1ifPgY
 lLqou/yUK0CegI5VZBLKpx8mtAd9OYb+AAdE2HsqJAXVAaRya+a37YaHDcppph90GcJeIInN+K8
 5wG7wQQVE1RxcwodGHeJ77Z7FMF/b80qIJI9gFpEcMxA8qeRubslSHn65RFoNxoRxRJkJWek8OG
 tNpK2cxpN0mIkCA0KtjBr6KKjPj51DKNJ+NxQS63Jk3ynfi0NpdC2NGksjg5FR5QKu313EHdALK
 vvnkb5cgXlxAAhAfnkRaiol5+bDQAyTZwSXHims1+sM7XXvmju0yhQpbkhc9eaibb6jqCoyI9Ch
 WKutj+XLsrEx6xYTL4QJrRtTj2WdJyD6ZZXADJtVwkgN5OpqOyr9zm0c9c3Gy8luJqL873tERM3
 7WFdELkgi4jw9XAjn5SYn0sQCVygqxcKvwyAJyyrpajPO3RXKV2LNzawIFnwP+iMKwkRAZouC5b
 qIqZuOWG9fMQyWoZJqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140067

On Wed, Jan 14, 2026 at 03:23:03PM +0800, Moudy Ho wrote:
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> To conform with upstream naming conventions, this patch renames the
> existing firmware file "scp.img" to "scp_c0.img" to ensure proper firmware
> loading for dual core SCP.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  WHENCE                                  |   3 ++-
>  mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)
> 

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/865

-- 
With best wishes
Dmitry
