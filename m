Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B00606A31B
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jw+KW2A2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvNx1aOx
Received: by smtp.kernel.org (Postfix)
	id C2C291F0093A; Wed,  4 Nov 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793798590;
	b=acrwmJ60j/yG5Cu9mfOVqZgSeO+8k6tVASUnLV0j6y4I5ZJbrf/NPpa41aiX2bbiJTZh
	 oSuQszZYjYdGRthEXATRek6wGqnH/qqPu4qHKy9kCUJWpMiJqK/b5qboEwZz+YmzO+B/o
	 rRu2+LgX+Sq20pC1w4dSTYuZErWhmpLMlZLrJkUDeFl/3UpMeYPUVAsrNk2nuIL+CvnHT
	 OZ8WSdgj94R/yEYwjpZlwFzvur5x4CQ0TipJzyu13KzTI4azF7M1ltJ0Y1U/1tUHi0Jvd
	 T2t0PzqFxZL/vwQKVkaze2/8Il0Jm61GrRnFI+IWRMsA87Q6HS5H4pHzXByVezn/efQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793798590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=diS8/9tlVMAZN3wNZRQm7j6gEvvsM0krnFJJw1lPBR8=;
	b=Da50H2U7Ti+BzmaATrEDklg9rcqY/XAovFdsMDxhRSDqlJ/BH7x5rT2j0glXRhDuR8di
	 lf8bHMEaVl8Myf2youzKfEj3kVEaE4ZOO158nRlmK5NmYhUDhP0q7Hx7mHOejInOXn9s+
	 QWOjbjk1eDrRMqinp0y5Zv1LYoYpXQuyNg5ffd12jSxawyoQfNWGA42ENEEzu++9JWKAN
	 ZV4fL8PA+rO278Owl2/H3w91fmJm+bAF6lIed9Yq7MZuoKPdaE92ffPi+iGZ7tfoBIMBZ
	 PncRvgDSucmdSZITSEfd1o+f7gxQz1TOJWAhy2U9zkAXGi55haw9iwTZ5hx/ZT/kFPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jw+KW2A2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvNx1aOx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A4E21F000C1
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 13:23:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jw+KW2A2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvNx1aOx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1A4E21F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba18c2310239
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 13:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=diS8/9tlVMAZN3wNZRQm7j6g
	EvvsM0krnFJJw1lPBR8=; b=jw+KW2A2OFTgBo+sb5rNwBRp2t6t5w9Yo619b/xH
	f6b1Ou4m7L6ME0EK9ht629LCzlhe1+qy9JIUXoX+F6erdqp18HxyQXqTixvixaTc
	XhLD9ayNbjMe6qEifCGYzgEbH0AJeVjZaSzYDVQREzddacsY5h9sWORLf6yU28DI
	oVw34ALpanAQ529O+eCtszijF7nclHiS8PufnRKFAg0e6v2WsnWFQsaJR+zPOodQ
	JRxyL+nW+VyvwMEmrjBdDtK9GUkl3ZAPmMQqyq5eHiNvYNPWfge5GPVPSLYajxFx
	+YOE+bWiZwBkb4autplls2KPZ7m3R74GD2k85LRBc1JVjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mv15t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 13:23:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c817b56adso15012706d6.1
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 05:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798588; x=1794403388; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diS8/9tlVMAZN3wNZRQm7j6gEvvsM0krnFJJw1lPBR8=;
        b=HvNx1aOxwEYO1rYdpHNZ8gaLuC5XveNYv6R8ibLeA9cLTS+0MWBm82E9URc33H8kTY
         N325UqEftaJAIT+lj82aYrBOwuxL9YcY/HJhWKyTirq2YGU49eaZD8x0Bdq12TO1/WTV
         dTLwpH0Xh6SQDiRqzXQdrxpb/G/R6zGK4D0anfVHc8ucBLKljcR6bYQOUt907CzwUgtv
         db89U9sNqisMsPFGxqqmVk73jjMHbWqnU9w84AGuuCuw72ifRQT/AosyAwRD0kuDHieF
         c8aNLKVWg+VrVABmRwamAdtV6CqWGvXxPqh1lAPJ0vCi15v9u/6XQRACtPoJFTKCYtEt
         Uazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798588; x=1794403388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diS8/9tlVMAZN3wNZRQm7j6gEvvsM0krnFJJw1lPBR8=;
        b=cJtZ5sPbAx3jjDgZomaHquagdNERgCx/4IkjLaCw72gv5x9AhtZ+k56/xw8i71DzsB
         Ms6X8gVyFaV6cQDgrG4HU6Y2EnMuVqh+pD7Lf5vlFWqIQ89cE/fojSkG6hWyNHgFkwzt
         a3z5XPHp3saWAr74hyIuFESRpyiHSuMYFh/RZOLrzwUdyNBwfWdvEWhjhBlN93tRfZYe
         n8LQHjW2Fp5mhkbfMe+nUa1Lw7132GT4CLq5M2cDuGudCYgbtAGSu8r34gIpilb1bZEA
         ddElVYSc6qE9e1y1Xs6AJj9eblEH2jgNJvs4phIG6vNIVTgg6J4sx7VTo1QDCHhxM8MO
         gHPw==
X-Gm-Message-State: APuU4Z/tbznI5BFnbcYRwiR3pShr4NHIe4gmcZSHmQgdT8SIdda/CwV5
	lm+6Y1g1clisg5qx2SGHcFiaQr2tB4G/mHTENYaSaiMLtuhRG470TJil9DHh6b8tTyODoHVMKJU
	j0+O7Aj3Hf7O3VDEM9v9gwecJJxzYuQVc8tDmxHJwTrlKlzOOxC7Lrj7gIbqRdvs=
X-Gm-Gg: AYBFou3xBPoVUP2OA7k32e1p4oKHzaCmH0IO9DE5p+dScYSKmWLSm2sbbYqlqnGG6xl
	oquBbX2ePEL4JLaiLnapg2Q8cw6nP0j1fEdOlJDq+Cz5cqwGA2hySnG9vMDmYOZc91BNyxvt9FY
	iC/II6bqr+iYlQLAZugC3TNixAsyaZRJjybBr5kVR+OFCBSv7BWHWZPsBlzjQ5np0Z33Dc4AXsK
	ZesU0pEE1XfofeYd8gogM7bqXwW5GpPVp4yzQ2FCSP00bwfTSBEk8fFKnZO/fZCuBX5qWap0Q5+
	heAoz6dCCSWjE97F9V2UjCU2zUZBmpARc2OpzTyjgVjcVptBW90PV/xffr8gkC3tvGvNrgUczAS
	ZZwbxLlYUyPGBV8YoZ7iEAEXxB+x2ehGE4k06gMdc+U8RvTDdyOv/vAS1Z5iF6EsTPlDeRFycnV
	1+2IQ7S9jZzCje8KecZxr3vRk94qAK0CEwxHBHwgk8NDJoxbaGb8f8tpZpkzmx
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1375237285a.75.1793798588307;
        Wed, 04 Nov 2026 05:23:08 -0800 (PST)
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1375233585a.75.1793798587847;
        Wed, 04 Nov 2026 05:23:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38b4acdsm385048e87.31.2026.11.04.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:23:06 -0800 (PST)
Date: Wed, 4 Nov 2026 15:23:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: Eliza Linux-firmware: qupv3fw.elf
Message-ID: <ucfynjrfnbp2qx6rithwfhscmwct5sriag4qou7rbmcos3ja2w@ld5pqvns4uco>
References: <ad028868-62f6-42c4-b325-8bc9d3d9125d@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad028868-62f6-42c4-b325-8bc9d3d9125d@oss.qualcomm.com>
X-Proofpoint-GUID: O36QYXv4CH574S3A7T16IafQCPhU-AIr
X-Proofpoint-ORIG-GUID: O36QYXv4CH574S3A7T16IafQCPhU-AIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXwW6NxrHVGQMb
 OpvyPeUVe2CcLuhPD99BNlIKJMyJcsgj3JM5vA5d0a9g9cx0+XMI8UTE4rx0heRsShESFk8FAyi
 kSbLw5/8u6bVtoGB/bRFoydiODUzimPPuz1eBMNoN6MVCscx5FI/ClPYHAlhrWEoLJusFo6Y+xH
 6zFCP2p9MHPo2ECFC2NTk6HWIYFXd8azF7gPzLjm/kSYAl4NAxWkh+OBskKgGFrHjwdB2JC2AMz
 W+rpc3NQa6y7QgL53AdJIxn/J/Arxw3sJ2VRm6m7eaPWHVr0NoKrilODrqAdbdA8LBb4lRC5s+X
 VcuTqraDfBXTvMiQ9cBcQATnwEehhkwaQdLfq33B6HBRTLTd8LYrO1YIcWQbC6eOzdnVrWHs9aK
 1PAEiq7HDzGuBfsVVePMOWxd0q1f1lip0qN5F5Aiygl95m3Qloxe0gBJvo16+hYcUoJJgsZjoB+
 L6Wt/tZbbSc3/iiDDNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX1vLgyFaOJLLw
 tkqlcWeSD5kojQMqHPrySII/QL1HjhC+SenMia//v5/BbeQGMFdHT5enoZ9HMMWytyLdt1HUob/
 fNeshBHM08bQhLtr4i57biIByZKQ5D8=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb31bc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=5QtNKmsgbQUwuU0VAJIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:45:42AM +0800, Xueyao An wrote:
> The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:
> 
>   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)

Nit: in future please use a more recent base. Using the base which is
months old increases the chance of the conflicts.

> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-eliza-clean
> 
> for you to fetch changes up to cbea61892b35d92ae388e8391d12fdaa233102ce:
> 
>   qcom: add QUPv3 firmware for eliza (2026-11-03 11:40:58 +0800)

Thanks, merged and pushed out by Josh,

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1351


-- 
With best wishes
Dmitry
