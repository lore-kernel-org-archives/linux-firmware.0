Return-Path: <SRS0=/1+e=DS=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34C8CD5BAB
	for <linux-firmware@archiver.kernel.org>; Thu, 21 May 2026 20:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD0551F00A3B; Thu, 21 May 2026 20:14:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1779394463;
	b=H2EGIb77MWAl+sGPYTXdHdB9fy7cYEZeq1vOXDb4sM2a/mg2/qQeoRJL2czJSTb8E1XD
	 DrXeFJG9oLNchblKqWznx0GLDMfdZF4GQmE7Jb9c9B1YPGz6Oi0IZBJDe7KjtjPYuSywk
	 kpxuvo9CF7SVS2N9jlMqFB0HF6S8fuEGwJTaHqU2cbHNGiXKx/fAMojG1USDXEc1y4u5B
	 fOjZhfajB5PHrClqwGtncfiqhkX8wYe+B4KALKW/UQZwsQrFLyyFwQ/MtyCqqyL7pKD79
	 ScZ25E3RSiYIIyVW5Ys8t8ciOYcwGH0jCvyeEocKRhVype11vGM++peWvyLfe19R49Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779394463;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ueDIA27pl/mJZqzvq7IVF0n1cZZhkytLdDX3LdFiiJA=;
	b=yZq9iKiO3aXmdUWi/fyEQhb0mmZeeFNR3sEjYwEZuB6XSkLyAkdCNlbeSaRpM5HwsLwp
	 gNmslLEbiQrL1Nh0tKQYruZOZYJNx3+6roW4kWoY7Y7npUc8PIWBDz7aqZY3hhYq6maRl
	 LZjAgvAGfi8yUhzNvX3M/e208923+imFpLiSF1H1OGyv0tZlR8enkVA6IfEs1mWIepZ/l
	 VVrLg6LaPzQVZ6OnNQDXVNbiPbyiG5BXk5Yg0dQLHoafXzMTX9r2EkSLzR5EMEHAQrWG6
	 bCefaYRjA/IvXf4Iz/3pLEXbyrDpR8pLsTKqbIMaWK08Xji+v8BsBljuFVpX284ISDg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbBYn87X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xhj8c5/6";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFDB31F000E9
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 20:14:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbBYn87X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhj8c5/6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DFDB31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGkCx0296861
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 20:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ueDIA27pl/mJZqzvq7IVF0n1
	cZZhkytLdDX3LdFiiJA=; b=hbBYn87XHOm6kTbSHHtxD34cURKDcacrq2VMydGz
	NfVY0/1Pix1/IcKbWFDgQdnkuBfBfCw4bkWfRjjL+DLTQUhZW2F060kZkUpZ8Sxp
	SXzGtY4F9MIHYOGrdGX95Jn5slTIzBrfly8xvesau+y1HPVTOL9J46ox8eEklGaZ
	zACjejQ+lRr2upJItfWfLc/zTYGxZO5x3h5xj1fJzdBbYobbyClBM7wggTWA+GeN
	HpHn+NMnxom9pYew6URvX5+D02XlMri1BCFNCCWtuCEsfSJs5w6WK8Mqz7lrRlRc
	+PRxbtJ3xdmg4Qh0k38JwIbETaiw7xuuabc4KWtYvK8zdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1haqjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 20:14:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso3714424a12.3
        for <linux-firmware@kernel.org>; Thu, 21 May 2026 13:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779394455; cv=none;
        d=google.com; s=arc-20240605;
        b=dmyUW+6mYU8PIZPxpWBwqCtyKzTNu7sHEV9yfu6FnN3NPUxRN4foKjkCkqxGL6zibr
         WjD2yLhcFoqkgTgrfEOTa4/VjKw+22Tr7ZXQNEm5zxIUlti1AAzAZJvCZBZ3ut4eQOO8
         szUEsxmrsQC25UWibZDLdIo4wyfe/6pKlFH+m7WkPXIh5UyvRD9X/7uWg7BbSbliUvvJ
         TQms9XVxcXSVrejI6AH0zR01rD5kfTgqmKxjFeb8bCg1ngmAvO0ms4+0l6/UiZtPAfsa
         b37/1mZBOlxGqfiEwN9+94qkO1lPthuEZhqaFkaUH5q3HsRUoLAFo0fENFdwb5yTzlJU
         fMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ueDIA27pl/mJZqzvq7IVF0n1cZZhkytLdDX3LdFiiJA=;
        fh=WRAD+eD3KgHkk5dUSdF1DB+MNDIaT/XZwjYF7MskXKg=;
        b=aUmyslvqlcuYYmRxwUfhxek/Kho9ZB8NWz65ThKw/XTITEeQwBZtyJcGMiHaa3AULT
         zkhtylLjgjx40KAjTS8ph18LrQPYlTAQostAENNfr5yTeplNBOTpyZuNV4MRsuROMusH
         TjEfv/rj5fnRUf9+2horo+L02cYjCiP2jgwPd0fH1di8FWjYYmJOMGFrD6vpoi/WTO+m
         hFLNDRn0V4WLI/Tbn5dMXAXkbMfYA8Ws4Jvlwto1CKSqSYIIw6Y6XqzxZKjjhEHhLJIG
         SnwV1YHaz2R8f3zcoUkqVX0jwS+f5hH1qETKX/5YlK3gBiKdpmLdRaQ4HeO7Ik5JFJV7
         p2Rw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779394455; x=1779999255; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ueDIA27pl/mJZqzvq7IVF0n1cZZhkytLdDX3LdFiiJA=;
        b=Xhj8c5/6CigDaXehCsbaaxhL+SJsbbWO0zEJGA9uo4rn1trxcu4NwFNyIVlxAjM671
         65NVjUiwVCxGmdrh9u2mkrUdDvvg6O+WSCEPhCukPEu0IxUoujkZ4MxQ8sLSdCvjbBK0
         Wqe1pjNs1Htla+xe1NnzaUcye3VZ0++vpFtPJmtEVyW0N6UpcQ11TUSchJnjdQwuO7Ly
         2iNAeH/Lz/E4wSRjSO7TSW19Dy1KYtrM8jyerkrD23NsGQi9p/PoNC/txYL+2XFgOwBb
         Vgshq7BwnjNcVsPhczeJn0hD8U7+kEtKpdJ2Nkez6bYCoDqN8t0bd5qieHf64m+MXlxX
         pMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779394455; x=1779999255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueDIA27pl/mJZqzvq7IVF0n1cZZhkytLdDX3LdFiiJA=;
        b=DMSDEyWDnkO1iuyHUlM9vOL7eZd/fo6ds/TMDnVAL7H9aSoBf3D99kJNb25GttTURM
         +Jc6s+YjuHhqKqprAS6vRqAkXitGErO7zq5UMUi6fJVesURT8tlX/uleGa3L01MjzeDn
         o9E0DlpukyBSuLZNx90VrXCvNgJexgydvrkbu/HbnEeZy8Z99PHAKVLgsHRfax7pcLGi
         ZXvXILRLneEifWye8J1vFEWMaRQxMwoHMlSt6tO79SLnFibJeQ2ywSMnxRQNA09bwQwI
         iFeKow+y4KKaEhuywB9n4odJ8rdXEndCi4YRnFEnctnL+4d2N7REdUre66OrxrQ1l8M/
         1sYg==
X-Gm-Message-State: AOJu0YxA7SsAAY5iO9TtJag2hAGcNsvaekxsaZ9t+9HjpuwMTHJtNqif
	7jAe7lSDbPoDwZooQ5GSGBOYvqeb7LadOmrid7TPI+cnCU9hN6RWDpXlT9Pqh33ynhi2x5PMK/x
	zhKVBXGi7MczKauZUnZ0oHZ9c/oFirTZ9iQw6OSSWValm/VUg3z0D/CKC0f6DTPyrggDtK/f5kc
	WOJy+jzT1k1r+Mxsd2v5jZhsa7rtbIf26PKxB/rQ==
X-Gm-Gg: Acq92OHk2JZ/7CPZtxYRR7hfjzSFhqgFasI+RwFXkO6fWU48p0O6Is2zJ42ep3/eF5i
	6VobVlO1H5S3Rx4liMiT4RxqPYF2taZXr3Mj1qrtcMFuvyaDn0CWx5sVuIzQaZ/Vub38EZylbPu
	oyYoELvsfH8bUHpOSdKCaPyLVCYnQk+7T1Q2/I7e0EWSrUsRdSaDYBZc4pV4NN5rerkdCh3mM/2
	B4xzA==
X-Received: by 2002:a05:6a00:ad02:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-8415f546346mr648451b3a.39.1779394455249;
        Thu, 21 May 2026 13:14:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad02:b0:829:8c08:d1f4 with SMTP id
 d2e1a72fcca58-8415f546346mr648428b3a.39.1779394454628; Thu, 21 May 2026
 13:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <b84a2515-8d03-4dba-8aa8-5fdeac519b4d@oss.qualcomm.com>
In-Reply-To: <b84a2515-8d03-4dba-8aa8-5fdeac519b4d@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 21 May 2026 23:14:07 +0300
X-Gm-Features: AVHnY4IUs_jv804ZhZlSMjtkm29jeiMn6Awp0EhwHChFTQmlNxRzwb9rGrGGXFw
Message-ID: <CAO9ioeU_fiRZpGnGMeJzqrmcgB+_NuQauA2G0pHO_dbHwSTcnw@mail.gmail.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Shikra chipset
To: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 8h_lqa9zKXg1wF_taB6QscCOEXxHGogA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIwMyBTYWx0ZWRfXzxiFrAfMxOQb
 JEWu0cCOMY+pNa/uj9fqQtHThbP2Gyfk6h2bW8kaVWvGkhFTDGTHYw6PcWBUKRe/RtDKIt1Endk
 +xR2L21f/+5B6SA5jrGOBVXXg0X2cE4B+ws+QSa0ipCSPd/ElUvffNLyXPKXTLT1UjElg3M1SDz
 hNvlxhjZzHi6xzGv0pQrVPPZwB1lZDHlByTTMzIVD6y386CHl/NdhyIj5bLyHJJKXYMaqcM/aj5
 cz6YsO9hLX0IXytsyx2W1LhBrJzWNSBTEpYCfErjR1oLDBpOSordGWZNBFu8LymeITDdQj0D5IC
 VzVuqsH1AKmM43v1Hu9ntu+GEg+7zAH4TM7qg2kbAiJTI35FsTz/F8lao9t9oty2PBx96L14taM
 bd6TbFJne/o7O/5feCLM3BusQs6Ni0jgao2m2ZfCL7NR7CWEWZBkVSnc+OsYa4H2MERj50gkfdq
 wYzJ51IgcAnw+jaEa1g==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f6798 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=zAX9EsUIyEu8HAD_f1wA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 8h_lqa9zKXg1wF_taB6QscCOEXxHGogA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210203

On Thu, 21 May 2026 at 22:21, Rajesh Kemisetti
<rajesh.kemisetti@oss.qualcomm.com> wrote:
>
> Hi,
>
> Please pull the gpu firmwares required for Qualcomm's Shikra chipset.
>
> -Rajesh
>
> ---
> The following changes since commit 0b3d2f91df7cf5da3dbd15decaf01e8d849f4a2b:
>
>    Merge branch 'robot/pr-0-1779371264' into 'main' (2026-05-21 14:12:07 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-may-21
>
> for you to fetch changes up to ef77d60eebbacc4abeb266e0615d60af2229bd32:
>
>    qcom: Add gpu firmwares for Shikra chipset (2026-05-22 00:18:47 +0530)

Thanks, merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1061

-- 
With best wishes
Dmitry
