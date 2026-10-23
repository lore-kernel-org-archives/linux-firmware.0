Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94319606A31A
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2026 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzb4sV1s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoOkdhO3
Received: by smtp.kernel.org (Postfix)
	id 8F9E31F01828; Fri, 23 Oct 2026 23:13:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792797223;
	b=zhin4aNwRVA/ZRgJCfR81T/ev0A1r5vRu3YqXKwBp9ujBTtClfOQEqQ57GvE0lQVnLLY
	 7Ik7QR/MhZLGcQhy1Ay9m1D3V3Z44FLZA5YyB3C9iGDk7Fmt2vx3Y4dL44VGwpSEMJ9ZK
	 rETHLQeSrDoqKy6s94jivUlfz3iOu24WqtUn1U0TPOSz3Zoqkrchv8TRIweMfeWbgx5CF
	 QWG4YhQ2uYq0v+7YJuxNUj5Divn26k6ltc4i1JRo8YIEhr5D/roTN98iRozL2E0cTXv6k
	 /U1nI9kInvBkvC52NdlF+YgsxZyBxCbM+jbuy9Gpg5OMIx4lKK7jPFG6mmooSC93Frw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792797223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x8Rot/S6a+J69Ja/vEmFypy/jOIRz7GJY2lDY/0Wzbc=;
	b=i5/1Ebw/JbvMzODud834NFSiJx8CfceWQDOeiaYcTgwZzOwQD8fqUgJB3ovp0Vp0dNpm
	 fZYqE6zDM9jwT+qmAV3hkOwJNq/7iHkC+UlxrCxuNrIwWzTa/9KiPfQRZ+Op4BezswRb/
	 fqwyZwpCDrtFrG7JhnOikNTKlVGIWcq3b3laj5Qk/vI1eyTOACxprrrVrYZgRX/RtuK2C
	 0LaALCSMspETG+qIW8ayNNgJ+OXdFTIpIikbCMwtg0gCpj4buWlxkVCLodyu6SQIp+Zta
	 OEiRCNciYNfe6WT7A+PhOKL76DHp6veIvK+eZpfrDZ/JFTlRe5Y26pVPhZj5kONlVWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzb4sV1s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoOkdhO3;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FAB41F01825
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2026 23:13:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzb4sV1s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoOkdhO3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4FAB41F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv1Tg3982646
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2026 23:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x8Rot/S6a+J69Ja/vEmFypy/
	jOIRz7GJY2lDY/0Wzbc=; b=Jzb4sV1s9RU6vMuaYmm0gNY5rgsgPHGKHkOVagHJ
	wm1UJvisaWMyyhGTssA1qQKWVsncgHqqQCrJRaveEWUHsfh7sg/y7dP7UVidCh9j
	ehDJDOHZ0Ql1BskzvfiqYruR2f80cWYhGglw4jQ64Ot/91wvFnyEpbKoArd+iKeC
	C1gm6DWlarMZsHQwBNFXuRgXA8u6CgjiXrQWQCtPYJqz3lJ3yC4KC6WnrK6HbBJt
	dbv8nfk9ozLbrgOc6QPk/sUHGh3PaGLJ49s/jsbEvA75DoYKbe15C1sFzxB1tT1N
	Cby7Vpn5EtrwgsXpPYrHtkmYE0958/EZQfEqcoZoydCcCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1cck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2026 23:13:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so239501085a.2
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2026 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797215; x=1793402015; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x8Rot/S6a+J69Ja/vEmFypy/jOIRz7GJY2lDY/0Wzbc=;
        b=UoOkdhO3gwjO1XDE1qSpmu2eW8C6sbOi4BnCioxyD2rEeoIT6bUwcyV2++xDP/BtAc
         BGgFsRhPu41lqLDeI3A+/kvNkhqWv2aFxCPLRL/T9Iyupw9CY5ykhCtcfXFK5+2WYJCu
         whbGKlYRAd898yZF5d3OsWavIHKy0mF3ONUOjrXBzzrc2rYD3WIyCN69rNwFjIympqcC
         8AYl+MV+8XlIFY2sgirnC3RK6jB2ShgtJ6EzVIiKvs0h+ck7YW/ffhZYVz8kxgnbXkZV
         KYCHrW0Xakqoj3m2LzpMOxpplYBeY7J0UiMGAwLfTDE+byezktMs+dMEP93n1cAlfr6j
         hejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797215; x=1793402015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8Rot/S6a+J69Ja/vEmFypy/jOIRz7GJY2lDY/0Wzbc=;
        b=JgQ2ubFfBx9I6iLuVXStgIyj8KEA+5jaVsAxw+Uz6H5Yt76fMXu9j2qwQfWooQVo55
         DSq+Uj/28uISylNtv6bo+yY8an9IkSVLVpqr/JqLhZ/g/7rpDOR3yeatNJmSjLss3/6e
         Um64Y0kQMNaE0PJkjQqEZ89FaNPIh2vsgAhIXLiNKmElN+3hLb+Vjcww9jUgbIxHIz5g
         odvLIUfTChIg/BfHTwbgIaP7bkw2jRRrnvDgwE5D+CsVkLWD9T8LxH1pxOUmA6z4B8hH
         xzVijfgnBmCkfJ/luUJ/W0dTn1lK8d6MlOfVq8iHTnIdT99uRh+N6PWKiwtAOk9A6X1A
         Okhg==
X-Gm-Message-State: AFq9FYKxmD3aXe3ez+TDVXKt4Y4b/q+QkTblwWMBBoPNYHebZriTJVNq
	HedZ8UccC92rA/XOSDgqMziLMd+pV/oDq33zxANbPcgD+f/qTeQ/e8zkzBohA8nE5Z4H4XgBzej
	qcBIaao0eSeUdiYqVb8IlJ6a1OmCmztnBNDV5nvGvf2jv3n2N9JZ0yE1oPpB6FLs=
X-Gm-Gg: AYBFou0sgHQPBi2g7SSg9BkiorOzu/sDd4wDzffXBs8fL60UNYDekKVcKlE5LEzrQYM
	2eZSoPOoy+6V7uHboHcnJpoz0VximWVmAOvBBp5guHtpk+AcnKd4jqflKa5bAnoj2Y3pqgoJ+T6
	6ErriSKJcCHrRBswLMrjH/P7b6tj2yk0ym1GGtRABsrHlbyWVk6mzBwCXBUwsYPYDL2YvfN2tG7
	LOxZQjwFMPmcF6kCeu6tWAPfV9oDsHaRJbjCwxGPxNOCLBPUuwrlpJnBkDgnvtmN5Ll146bsPOK
	yCVybbNIY/o9Bu4yYOrwwumuFdd1CDytncm7oyUixJdQEKPIrsskK88Od+zJL5gOXOvka2wvkp1
	oY+E8b+euac1+eyhDAbcgkr3hXEmiSSahmcwrGa05PJlJVbcc7XbOL9Bt9Z5oDIFkZL2Skuo3X5
	rMSV2JuHzBPKDP
X-Received: by 2002:a05:620a:17a4:b0:93f:633b:ee1f with SMTP id af79cd13be357-940ef914daemr85250585a.28.1792797215269;
        Fri, 23 Oct 2026 16:13:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a4:b0:93f:633b:ee1f with SMTP id af79cd13be357-940ef914daemr85245685a.28.1792797214569;
        Fri, 23 Oct 2026 16:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a32bc8sm61005e87.8.2026.10.23.16.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:13:33 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:13:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jeff.chen_1@oss.nxp.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH] linux-firmware: nxpwifi: add firmware for IW610 WiFi
 device
Message-ID: <36kexr4fxcdfc4fa6oq7iv47avnrqjmr5cogv6qly3tmxlwqys@vgvgidalqkv3>
References: <20261023162027.3722338-1-jeff.chen_1@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023162027.3722338-1-jeff.chen_1@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfX5d102FSPa97K
 12soMW5/RD63mdcKsvRcegZfi5EkoRDOdiQEdFy3bGLsA7bB591co1dvmZv9y6apYqxUfG0DdoI
 EBjvqrQcm5PE7p1owaidlFNS4cKJYbR8yyX8tp8TKshKEev3k6WUxNojvc/9i04LwrsaNHS75jU
 sImPaZHPGlBeomM2xCgxlAr3FWxIBiRuejnBmq7qU/hSul1wU3Xfw1gCP6r69lGTX3s3h8IC51V
 vBKV/mFqlvBe7U4rMO3Mhj+mXSJ6xdSTbHIp3KrgRlbMJZb2GvVgpjZnCtLpPWm2/JZ8oD4MZao
 hdouJa8y1cllmvRacoge5H/AR03N+VmMep1U1XCa8HoIwLMaUXj4P/fQnoCp/VCDvAkZI0C2erE
 A9OQHtoYLrDnLTlv1z0546rpJEbWf5G5vX4EuSGmv0ay6WxBLfMrRE6lmmwcm9Zh7BAnFidSJ7i
 rfkQOSOGjOxtOTs4N+w==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbea24 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=8AirrxEcAAAA:8 a=xvxTnyrlddcJbnTBwKgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfX+foM7n5YmMFE
 crEYZ5smfFZLYDhN47b4kSJDu0Zzjf9FAxH8A51GAzThqchcAjSUWfsyfcSE0xG0fL8GGg7izQH
 Ss1EGb6unAP7zhkaVxSoaugKElO6crc=
X-Proofpoint-ORIG-GUID: tDEWFiEhUgm4cWGkoRes4ou5hoFoKZCo
X-Proofpoint-GUID: tDEWFiEhUgm4cWGkoRes4ou5hoFoKZCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230091
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 12:20:27AM +0800, jeff.chen_1@oss.nxp.com wrote:
> From: Jeff Chen <jeff.chen_1@nxp.com>
> 
> Add firmware binary for NXP IW610 SDIO WiFi
> device used by the nxpwifi driver.
> 
> Signed-off-by: Jeff Chen <jeff.chen_1@nxp.com>
> ---
>  WHENCE              |   9 +++++++--
>  nxp/sd_iw610.bin.se | Bin 0 -> 621088 bytes
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 nxp/sd_iw610.bin.se

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1321


-- 
With best wishes
Dmitry
