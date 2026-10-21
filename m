Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BA606A319
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw4FI+FW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLEPr3P8
Received: by smtp.kernel.org (Postfix)
	id 7B58C1F000C5; Wed, 21 Oct 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792582015;
	b=tm0slO9zI8uU6YqC0kx8p2HZS5XJFZKgpD8nqBJz+oNgqhZizzCk+cdXOb/TrtfUqotX
	 MAvAVdWzEIC+NG2W5uxQPA/OvEXjUJGaaTLtRLsabfw91RCFicCAhGaZcFeigWiPUBX5U
	 9ciFbcs617mgOvwtRPKrSiDGQR1TAEOqgnt3PMG2nAoOHHsQsFuq36z943i8CLl/5jFJC
	 rDGd1KXxUOjIxIl1z2PBHAXoMl23AZrrFgupbefM08Ji+nWl5QTx3Lu5TJ1GX2IsSC1JE
	 HyllJ4T0QdOGH1FJhp3hcukcGe5cUScLLYFAQdlCGM9q0aaldeF7WTK6RCEuUKQaJZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792582015;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WvL9tZgezWtaBUS2ZUrlPjn8WwRzx0T4jkX0Pl4uDok=;
	b=C+8YqwAGIkWOUogbvdFxG4sEb74kfj8ooXpbeeNi7nA3NmS8pCJa9nG6eR8FurwF0JTs
	 zsC7OxdKgbaZPCfQoRajTS71mP1C8OUz8u40iYg6DHCHA03O9qPJCr94eKn7TRF5MO6QM
	 Jg7r8yiGGEy4RTd/vz8RnuUsJKgtSHrHC8ZnQo3A6szsbX066ej7t0/jZ5KR1yiyzEGnc
	 vGefBFRPTjxSfWMzN6xyXe2is/082jpUaTaOYq0tSYj4RQBrFwNQqaFf4wUQL+lo8kYnm
	 wkd5/FTqrhHmvpodaE0yy4Pn4m5rRAcbhsrDW3xFF4V2MW+5wQVmH4Ll9UZgk0Ebm7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw4FI+FW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLEPr3P8;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C57211F000C4
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:26:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw4FI+FW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLEPr3P8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C57211F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Oej118830
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WvL9tZgezWtaBUS2ZUrlPjn8
	WwRzx0T4jkX0Pl4uDok=; b=iw4FI+FWYxVekWCQJ+s78yXZMXldTD8KmluIutXm
	1o4gcwucAoAtjypvufyqsLLSYyurF50oonvm0bDKnFyTu6g1zY2spCCkGsTQF/SA
	Hl5nOPsjZOSA3QGNdSoyPQFup6gM3UcaAWubUuMIeuIoXEzr58R4B30vD4wv8omU
	7h2VzlftQdVN+ZoECdVrbIzYjY9KeRucz7GRVA2sH1+Mn0F4mYezLO//ssJH7s0D
	2i9JxEEe8tLEFfhzf5CsSISOgbjpEFy0O0bi93BJS9vWCG/6BFcDyXVbQGAu6opl
	vHccCJcvSv0AbxYAJMxPwoQSESoTRgPyogYO2NTU5nstnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3q8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:26:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso83813385a.2
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582013; x=1793186813; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvL9tZgezWtaBUS2ZUrlPjn8WwRzx0T4jkX0Pl4uDok=;
        b=PLEPr3P8DTY7obPLv+5ZjF2sJiR9/Hy9SxIMcwaYWhzDTm3v+yk4tPgiolzkpebMYp
         CtsXlGJRFy6SpNjA2w0cHHjfzXd2wmfaatFWnRg1/5pi85wEvzBze1djhM8BVj2MBsjs
         U7T/Z9Asz6052mADlJ5cCkr/ra2bB8PxmtjIxYCFhNKPMPHtVtELlvewt4Jo6fj4OAm5
         Th8OyN2EPXb6XU/9cKvcYkM6jBvmHMjxlBRJsmk4MarCWQtEW2+uMM4SHAP4jhllBy3G
         kd/Hg/agwKgoAfu643aJexDcvDsHlauaugEMaWdVLjBTswDXC8bA2BKoKaaEkBolPi7N
         jMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582013; x=1793186813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvL9tZgezWtaBUS2ZUrlPjn8WwRzx0T4jkX0Pl4uDok=;
        b=WDGLeIqh95OtTzdTXe5nEcxkEftwzmAUurS044wrDkc+hWKxVo6QcYE6VF+nnEqNE2
         rB4fXrbWi5GJUDHzsefAVi+QGBN/+/ggafCX755R2N7SO28fjwG638QizMv0oJ73GFJs
         GLqSbDIvJRZup9/Iui15Ppk9uDnO1zIuDvH/isfKSmzwDfmO6XXn+abn+g6oyB9T9veA
         JBwPlzrQok8L/4LYm20PsX7F8NJci78QPoXk9UAyYcZd2sUqcWck6VzgsKAYSOr4jc1O
         +b/DGg9jr5q66fKTlPxC3RKzrr35f4xx5VCuDgGcmS5flWke47DFr7avNUJnW4ltmjGE
         Rt0g==
X-Gm-Message-State: AFq9FYIx0oR+xx9/mEoAKFYLUeIh0VKZMtQ2kbeMtzK9fqd0hbFU7Xk0
	2k3HcXvvYukqCW0zc8TVYuubTIyzVjnJSvUoAY5Q9miD13TzMzdNShmKSyPU7Jk4HmleY/JUD1t
	jx5ATgLGtnW2rFWQoFZNvyoi2mUrVdE/AkiZ+ttAuxGGfQHfBeaH0fk4POiSn6bk=
X-Gm-Gg: AYBFou3Vsnz/6rNX1UGMxacsUgtjOT6DgebHfm3hGZFvZBL468+XunUxeuRKGa2mf7o
	h85nVNVzWIHK7+E1d0T/fmPb88a0k0bpCMSLREy8+5wZyBdN+u1/nC1rVpJlElh4Rjvhb2oeL1n
	9Iz3RPbk0P4Ju8CC53Vu2ia+AO+x1ZhlcWt90KO7uwKJ5ssDhQeDCKLhZiGv/6exu2DZhAdnQcT
	s+GUrkw/JHMjwdPZRtrTs6nggMDTLTQ/38pBYHlutspJWbLoffyiGycyQ+lN5Gq+z6Q3dpgHJOi
	hT8GZDSfvkwCRN3DtjsvmLCiv9PPdo0QWeFTnlPBbssYWETNi6fN9P99opIWgS924UgyRTeMvjt
	aSoC5/9007vCl1Ff9AvZxtoY23Ja30+KqBTOZLx3O2KEUoTMbYPjk3YfVFnCm25XzI3g7po2zs3
	sae4FKYHZJdO7r
X-Received: by 2002:a05:620a:838e:b0:93c:ca09:aa34 with SMTP id af79cd13be357-93f57f8dc8fmr370368585a.46.1792582012841;
        Wed, 21 Oct 2026 04:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93c:ca09:aa34 with SMTP id af79cd13be357-93f57f8dc8fmr370364985a.46.1792582012277;
        Wed, 21 Oct 2026 04:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4373fda9sm5756621fa.13.2026.10.21.04.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:26:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: Re: QCA: Update Bluetooth QCA2066 firmware
Message-ID: <zoqzckdyfvz3uupspi55oforrtaj3gw5wturvg7pw3ppoihnvn@nxvqlqgdbjck>
References: <7849e6c2-9524-4e74-8800-0fce2c60705f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7849e6c2-9524-4e74-8800-0fce2c60705f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXxj+m6ry1GJbR
 3Jymxbm3Uex9qgact8vMNLbsEwM9AjOhppHgzu8dpy4GNDy8vwpUAg1BHaz0jv3MCBOijge0lUw
 /af7fcvUk7DVnjMYNFx9s4ZPY5e+wT8=
X-Proofpoint-ORIG-GUID: OF1A9dTnzkxdb8mqEAMoKTUBM0aRWax1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXyflhEn+aTMW7
 TGVaqgy6/PMPAvejZeOQjDkNIwN9TRbEXnysOAxcRU5rT4uS9xKiT7QZFXjmkenYbiaRtEpiOv7
 6/bdZeqt4ma1fYpjS8ah0XlzrTBPZTtOf2XZ9llCyCO93HbXJNgqJK6KniWKtdKWETxS/IYb9Oa
 Z6zfn9aQbK6ONGcqRMJWKRcvQDqDhXAcv1diYdUlwi1LLqAcq5vJ2ibMSHP0il/B4QLIe3gls0A
 VO2fmga2/QolBiROaHfcGIcDJhuXtalKXWdt0OGaG59QOidmNsRhCNP3MdO9RaOiBObQ8g5PUaJ
 Fn/oV5j4mW4NBd9pDSRjFJPL3n/gb/QyxdiIxEZi+7v9rMYIlBARnFIYeQlQOlYjftnhDNBcVXJ
 wbBYAdrT3ta5EZ8TLbD6FZjiEt85tFGq3x8eBTaX335FfOb4nyikGTYN9T3LH9zbCN9zX+NrR+f
 XmsFU3PQ6kut5UePPvQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a17d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=T56qPjpPKMmzyvqSM7YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OF1A9dTnzkxdb8mqEAMoKTUBM0aRWax1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 06:35:59PM +0800, Jinwang Li wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btfw. Please let me know if you have any problems.
> 
> The following changes since commit 9a80a04181713da7f8187ec928c15160137f3262:
> 
>   Merge branch 'robot/patch-0-1792477420' into 'main' (2026-10-20 12:07:53
> +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/jinwli-qc/linux-firmware.git update_QCA2066
> 
> for you to fetch changes up to 7fcdd92bd8c7d2a57500702609059ffe03407743:
> 
>   QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680 (2026-10-21 18:22:48
> +0800)
> 
> ----------------------------------------------------------------
> Jinwang Li (1):
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680
> 
>  WHENCE                                   |   4 ++--
>  qca/QCA2066/nvm_usb_00130201_030a.bin    | Bin 6917 -> 6917 bytes
>  qca/QCA2066/nvm_usb_00130201_gf_030a.bin | Bin 6749 -> 6749 bytes
>  qca/QCA2066/rampatch_usb_00130201.bin    | Bin 160124 -> 163332 bytes
>  4 files changed, 2 insertions(+), 2 deletions(-)

From your diff:

 Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
 
 File: qca/hpbtfw21.tlv
-Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
 File: qca/hpnv21.bin
 File: qca/hpnv21g.bin
 File: qca/hpnv21.301

But you are not changing those files. Please correct and resend.


> 
> Thanks,
> Jinwang

-- 
With best wishes
Dmitry
