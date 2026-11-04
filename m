Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFCF606D821
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCTBDXRN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQu4fksz
Received: by smtp.kernel.org (Postfix)
	id 1B7F91F00A15; Wed,  4 Nov 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793801267;
	b=v3sIqxzLBqhgyG4zUmSBA+TLVPNkkHBhyguxkY+9t/5eoxn3D+IuSX9Z2l2x3z1sEhWV
	 s1fwqV5xnpOd/D2swBi6SW1xNnDDPQv9kkLXtqqw0xTARAp1mzeh+E4lNrJk86lIR/p9L
	 yDIGWI5FyAE10cdLDWRu9PH0QKHKVT1mbdw+sM6EAl+XzpLvJbMX8SwlT0xOjWvB3zfIB
	 DE1JMSs0EHOOQFoLrWt0Iw6UuJupJus4VGQ1EeoO1UFh0sAsEz21G+GYr6Qwx4LnKHuAd
	 xHO2FvRjvvj+DbMS9TlAJgu7+EySGWy7zcxP5l0ceWDeIQMlFh6y9iTpGoAcipY1T/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793801267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GPanxi+V8IcxlyP9wDh6U71IY/8is8+jdY4cnjv5Cs=;
	b=h45KovqbqSuYODhh/HCbY24z+TbiPGVy7UF78cRoe8sPpkuLPZnE2/Kx3XzM89UPiyFK
	 5CNGKTGZW7S8V89CZlrTA7PlgdXllm3FOq4JEsdLAiGwL4x8CImcsitPX4HLIRt2Ses9X
	 VJqQ2f9a68RQSoVjWhlipr7YhmiqL65ola3U9Vd5i1EqS21LA4LtnVG+Acq0unmwlmeuz
	 d9c5w7cuPSWtAzKbhQgHgBj5ln9Za+/dGMnLoIm46ZOt3gkX60M3goYv1iyr7yeAa9B1U
	 C4QipHxRKnh61mkJirdi3f10npGTKCb/oot6y3fapG5B5ScapztkMRM3o2zVvkl41jw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCTBDXRN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQu4fksz;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 776491F00A02
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCTBDXRN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQu4fksz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 776491F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba0Fw1149880
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 14:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GPanxi+V8IcxlyP9wDh6U71
	IY/8is8+jdY4cnjv5Cs=; b=QCTBDXRNXpJYrkm5z4OcWTgbNJ/8Ua0FMvd8Q5os
	DLo3QShAxZSB67fPFGOoJZFI2g/6Kjtld0O2RfLrWlODZk4y/GDtPas/vl7w/IWJ
	u4GqDHwo4M+BkGtZtx9g+c9odYgTtXMotf53AdnptBv6OM6Ce5QyukwQL08A40pJ
	qzz/0lb5kmABASX0RdfQMUwXo6c1b0Gj+t1aQy3xFuVmyrtVr4GcoLbLq8kbJzq2
	THmop1HddqTJivHVfiloUnbv5HESCmiVca2qRUje0Vw2RSzHWw3gVIwQ6ikERe0T
	VWhgkq4RORInpj44vRFqlUhh6V1OKpshvr2wzxP08EGXdg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y43m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 14:07:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec21d5bf78so172200e0c.1
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801265; x=1794406065; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GPanxi+V8IcxlyP9wDh6U71IY/8is8+jdY4cnjv5Cs=;
        b=YQu4fkszY7XIYJuOBSGuedHaar8Jiw9YZYfN7uGJ0xYiUxM39oB3bK96wYH9quS5/x
         BgvTlie3oaqFPQXiaP8Mof/Msrq+1qoIUD3zBPwqHkCBrzwcnrUKVedDe4weJ8W0f09r
         5D8761wK8Gp73fKM15REsEqxBnSfOCmOybn9ksOWdmd17cJNx/ut7+haCpvl/i67eJBr
         s5vS+QGe5EWtj93mIfcdUFyhkmMfuuAwLP1TPd1q84chugGqsXX+gB+mxpFTPe1ngg8C
         MhRRJg6wjK9wZMQbiJWl9YCKaeOw+g1qeOyGctKMscATur2U+rR1XQVcA6hW9zmpfPyi
         f6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801265; x=1794406065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GPanxi+V8IcxlyP9wDh6U71IY/8is8+jdY4cnjv5Cs=;
        b=EiGkYg+Ew4PBJkZMEgGVE9dUjC4z0OSVxyFQakfy8zLESLTCNvc4BARQQvALL21yXm
         7IIjWeRghmS2XSd0HyrtSmIt6cxVF688kZ2Bh94Z3Mf3YDnVE7+spzzDBbVCdOIS+m5I
         +WwJ4vn27chSav2ZKFnRGZxE2UaIDR1/QaH9/+n1xa2OcKt5HRIuI84SI8ftvYptgt3/
         cYCDkibgnmTZABKQUKfdTCKPFF/QqcAno63JTAeVFPX3QRUEDPGFh+EeoRc3B/W4myrZ
         sFnDuDlSoic/6rBBqD5RFYv3T9eVvFZDJMtl6uNRzHm36DC3egu3Bz6XVn1N9pww5aQC
         dgHA==
X-Gm-Message-State: APuU4Z/fDrL8XrHF+f3JiKxjWELK9Thib4HDyI88o1AIteABDs8GBsSd
	ELJqhk8LXXniyO5LFwLcvqhXBlvZp6UtukpBNd1izIEcDPT8f37xwfPk+CeKUUUX/kCMWNgbxcj
	3QCTo3NyWs1B1c5dWq4wYtH3WTaoOdzkntrilo0JaG3c9KzCWRRXfmZ6W0w03pShuunqzc5U=
X-Gm-Gg: AYBFou2ZEhwJf5jFYXrWfeCk6lTrQjIhnTa9unovO9fG8UINtwJ/u9Ox/qBQzSSdpzt
	aiq0F9nkm8QrM/MbBoelM4KbmM0pJMO+e48MSoqSL3IUdufIL4jCRptFKTwwN6bVV8ctmoC9YxO
	nf9/8VHFMZSZ0gYJBe6tOw1Mpj1sbtshhgRaoXGy+omSitcMiqyfm5E7/9FD+CI0uMVNvPeUTrF
	oXtQmAKptgeZKmoKrgf/uuSpUfITmI65XDKr8dDfX+BfJAKeN2Oh1Ipbvw/AJqn8PQ2+TkFZ8yY
	ELi4E1QffYl6nRFb3fKtjs7xSeQE282kDHk90VEexFXvwgeaJwaZtD1onW2N3Vx8dRuSkvYa3oq
	nErtFbjOsMC3fjgzbgjIJz1n+bz1V98/+ToF0k5/aCn3/bjYvuZJbugrRde78GBZcIUfMYE7Cfg
	9x1X1Y2t12HgC4q1haCq2Rk1XB1W3/+Jhp2wmSLOaQ9vxmqluVDlo3WUwu4k3K
X-Received: by 2002:a05:6122:3c51:b0:5ea:c36d:dc5c with SMTP id 71dfb90a1353d-5ec68997e2bmr6616610e0c.20.1793801264693;
        Wed, 04 Nov 2026 06:07:44 -0800 (PST)
X-Received: by 2002:a05:6122:3c51:b0:5ea:c36d:dc5c with SMTP id 71dfb90a1353d-5ec68997e2bmr6616566e0c.20.1793801264094;
        Wed, 04 Nov 2026 06:07:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab798sm387617e87.23.2026.11.04.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:07:42 -0800 (PST)
Date: Wed, 4 Nov 2026 16:07:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
Message-ID: <rajdpyhbx63h33qhkigxlyv6lj4gk457vskutcb26zefagp6be@oabi36e6xjb6>
References: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
X-Proofpoint-GUID: dznl8cVGA4fwd2UN93tqU-UgBv4f5xIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfXwoN5DxTWn4zL
 IVp4/B/MKf/oam98GkynlGlu6SqvZfM5Ea8Upx+VIPHJ4rROHfNsSn+qOpI93jfslhgLLHv2G74
 JW215c3LV9RPPdJAVL9hyT/FvoNdaBr58XbhtD3/9BFzYLixizausT/E4O+GMYkUGHPBMliBsFC
 0Q5bAHzkRpgVL9Lns7rU/agtzYi8WizcwEgT5KwotOgW6pt0g9vALzNP7Sy3l/ByBL4q9hQs4ZY
 3NTUBedsu9vZDQZVrdHam0oyAS5bQVYLk8TmuYo8hSrWicmhOoYfopkpXsXnLVujg5BGCB4zznB
 UUPzS0IWNycDPsTGsvODmb1IKvEinP6cin9jCPXZLCYTQ7JPwrTf98c9KunEdVOdCfko1CqzqIB
 /642N9wG3hYeB+TcWbP4qgm+0hBp6YofqzdD7gSV6rTJFg1DPPjUFuOv5bApfE7LnAdG50OTv3O
 2rnwKDBcckO+zxeFTCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfXypy5O3GSk65T
 KibG/y6SWJ/0fVzHYAXxP00gEGq+6AhyPGUf6tezsMPvUzaJtObwKDcl6Ggs82Hr5IqcWCzxK2w
 g7/jxSxc+9bOC/hreEzYYAZNggoPLs4=
X-Proofpoint-ORIG-GUID: dznl8cVGA4fwd2UN93tqU-UgBv4f5xIC
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb3c31 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yCD5ciYiRBspOy6KlL4A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:39:58PM +0800, Zijun Hu wrote:

> 
> ----------------------------------------------------------------
> Zijun Hu (1):
>       Bluetooth: btusb: Add firmware for Qualcomm multi-subsystem QCC2072
> 
>  WHENCE                                    |  47 +++++++++++++++++++++++++++++++++++++++++++++++
>  qca/QCC2072/nvm_usb_00200101.bin          | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0002.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0006.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0008.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_000f.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0011.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0013.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_001a.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_001c.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_001e.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_001f.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0021.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0022.bin     | Bin 0 -> 10990 bytes
>  qca/QCC2072/nvm_usb_00200101_0201.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0601.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0604.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0605.bin     | Bin 0 -> 11006 bytes
>  qca/QCC2072/nvm_usb_00200101_0606.bin     | Bin 0 -> 10990 bytes

Separate commits, please.

>  qca/QCC2072/perinvm_usb_00220100.bin      | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0002.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0006.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0008.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_000f.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0011.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0013.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_001e.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_001f.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0021.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0022.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0201.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0601.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0604.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0605.bin | Bin 0 -> 498 bytes
>  qca/QCC2072/perinvm_usb_00220100_0606.bin | Bin 0 -> 498 bytes

I don't see a corresponding patch on linux-bluetooth ML. Could you
please point it out?

>  qca/QCC2072/peripatch_usb_00220100.bin    | Bin 0 -> 7772 bytes
>  qca/QCC2072/rampatch_usb_00200101.bin     | Bin 0 -> 247475 bytes

-- 
With best wishes
Dmitry
