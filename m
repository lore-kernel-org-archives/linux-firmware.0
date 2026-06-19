Return-Path: <SRS0=22y+=EP=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34107CD4F26
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 14:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EB761F00A3A; Fri, 19 Jun 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781880853;
	b=iMgPXj0ikVFMK6NehWrF5CCyK1XB1sburY8Ef68xh5I4RyoOpQHEGfyXuiq54w1CDiSA
	 73xYuTHPjzPtHYyK2ubGwMNN6crkYN3gBXXXo2XBwhNBsr3XfZnKQdZDwY47YeGKolW2z
	 DAr32fDBNNbK2nSGhW1kWC0eUjTTfbJFTsZZri2y0Nl8GaMETgPIm1MJacNYMqaWgYs22
	 zAWxY5CA1DTh50VyzgbMiOjyA7Lk5ilkNC83bzfI/3YL6kdAnl/aYn6njdSvaTEJWCrLr
	 CvWcr1YRNWXGIKsgXfnt5dSL/xeVq/qIDDLS1Z5c1I+WxEUPqy9I8MNdbT2dqDl8exw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781880853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CobLsqV6ocuY1PwUDX8Us25WlX8bkAoojf1eA8SDueg=;
	b=JlfPtPev/CEIhvyDawvqqAmuiQhHzic3aM8XFwB0Cm6/6aK/JXOcjs+qL9zZngdLnhfk
	 K0cxwPypDnX3aGYwnYjMndxi0rx9HOr7d/sG50cMkuv+5ixQv0lOvLHNoaPFbP6a0MeLJ
	 LagOrVtYgzjfdOzrKpdO9d6E1tXpBFH1iHzaETcYwsl0FbSNIh2RQg3Zv6GcVROaRkZeM
	 Ek+02TWHxOonBBcJ2STM0hhu2r55256WgA4BoqrH1XV5njaaNCCPy9u/pyHR+8Jv7S0+J
	 slzgzbZ5+CkOvb7X5zMZ/sGD76MBydTUR004b+diOqFqVUb6XHlWRvsk9As/MJBwRCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hiy/wr1+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4BCZX11;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56CD81F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hiy/wr1+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4BCZX11
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 56CD81F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDBtZh758498
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CobLsqV6ocuY1PwUDX8Us2
	5WlX8bkAoojf1eA8SDueg=; b=hiy/wr1+lRZaG4QKFS6AZZT5kfjCrfbJ0h6l1A
	Ft1DHSzFmA0+0JVyn9KA2geLDs7CV8YH/AvRzE+97fg5UyiYp5+EeU6F9GvNvX4r
	M1E5PhNs+IS5pAbcFd+Ar95LTJjXbcvlzg3Qg1rdaoCsOQC5EiURHhSKPasxsX4A
	SzxQbt+mXyxMsinmo3JumvugbBf2npOSI7DyrVjm1sLhKTxhDahbcrpDkK1YoFc7
	ywDRfRUbqvJhbwpY8/Xn47Lw/cS2DdyiIS0bPWkc4ER1leJZ18kyDxbOIgQlRaY1
	ECV1YZZu7XM+shQQpQCaUnxc7Uwy7xi2s/Rd2qBa+s/oJ8AA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp8gt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:54:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1399463a12.0
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781880850; x=1782485650; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CobLsqV6ocuY1PwUDX8Us25WlX8bkAoojf1eA8SDueg=;
        b=I4BCZX11sUPoRrMX3FUZxiiIuWhmlQWAIshup+8TRUurU4E7peLxku1d/DGMyNUL6q
         UcblhWO7gTiOUbGC8O+vJMT9TcvSZNTdN0HRNlYnLv83vBZQQEpHb7IFAtBqHTuAn5rD
         g8JDFV5fQ/35lOKiObsaFn69VJi99HCU2fawikugl/lB7GQoPptBcoXAY1P4UVWR+T/L
         DXs+QtFedcMa3OtN0azw5yzRCB6FuwsgElYx0h79vDtEZ92HuBi8HkfTBN0Pd8gvDCGc
         5pr3AOhqNWAzHIdg9I/Xh8hV9O8JOAf0nUMUG1K7VcX/XvVPQ37WwbD0R6SQsGZQvlAB
         IpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880850; x=1782485650;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CobLsqV6ocuY1PwUDX8Us25WlX8bkAoojf1eA8SDueg=;
        b=cR0kUcK/4zk/0qpG8FdlYFur/8MH00TatCXqGxlPJdHJjeYxLn//xWE2+cIiTZeqXd
         zoXPNfUOSL4WgcHte1aD07VHjGrk34DW/g9jkv00nNRNbdmouFdCQZ52cjmODomgtqaT
         bz+6W8JZWxSZ9ME02NCDXlWhMR2KAQOE4hk4RJ3mBhMj6KXQsaw9nAipoMXwBDW09gYU
         s+0Gbw2403p7oU4dhdE5bJqe/NnNBylYjPr4SJiXloHk/7nBMPwy+0OEE/e5rfyZL/mo
         hgMAVxq3t3L7Omcfq7uAfBcI8r5Gml5gA+3P7Iv0kcHSGmZ8YU2nOcr9XrgAnMSHjGOA
         sQaw==
X-Gm-Message-State: AOJu0YzUqZyOeZVZBH9Yes7ogICBvuo2yJgX91+Gn25QwYS4r0k2euNW
	Rp7WZ3tyavMqEXklQCAIfU/nEO9C15UltZwBDIaarEvqcKkW4XSchLOuxGSL6POjPoKAM0+XOcB
	dpS1JkTawJAt3K4noo9A9GOnKPbRv1mhjJELfw57nImWqcChPEuaDH9uIjCaZ/TahRtXrBws=
X-Gm-Gg: AfdE7cmhmVorP+6aXfqNCuPZhDb8u7M4cv9c8KRhhJCgnuC0Cq0/88Z4faEk1AKhMuX
	PaKpqvW8TF8l/lSxNbt/wQUFMrj3W2hPPp2he9Y4XuDWzLlIar7xZ7TGerO1uZUm8wK5AWMuVaZ
	jn7x7mtgBC6n23fCM407nkUGkffVB1/6CXUkvr/+Bjy6cEfAjh3DtHDhNTU5vFZAd42Hdy8bzbv
	S+97otah9ZJatJiSAlBCIWKVJfkUJMLKzkZXJOX4H6nVwx9c2VI87pRBdkRad43e/v8REim9Os2
	0lmHpljj5TYuxU5rKZtoJDK/LRSAMdgc5UamrfizBT7VA26z74hHerF0i2PEzJMhbC1UdDuDmf8
	BnkLvAykBs1WAzkOWXBBviZejJTYY
X-Received: by 2002:a05:6a00:4b49:b0:845:3961:6d66 with SMTP id d2e1a72fcca58-845508bbe70mr4473606b3a.38.1781880850141;
        Fri, 19 Jun 2026 07:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b49:b0:845:3961:6d66 with SMTP id d2e1a72fcca58-845508bbe70mr4473578b3a.38.1781880849619;
        Fri, 19 Jun 2026 07:54:09 -0700 (PDT)
Received: from [10.216.16.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553859f0csm3123626b3a.58.2026.06.19.07.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:54:09 -0700 (PDT)
Message-ID: <5143bad6-56aa-4e3e-af4b-5e50effc95e4@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 20:24:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Kaanapali platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G--o-W_px2t5wd30ypibq-oZANofaeCK
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a355813 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: G--o-W_px2t5wd30ypibq-oZANofaeCK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0MSBTYWx0ZWRfX/GofA0/n1qL7
 l+BgRwvjpu/7OCE8HSfS/As44zkGLTWqps/p1VVMHbgD0OC4zRhaHDBPSQu66npgs80vv7aBFWQ
 Yxexn1CJwKbqss1DMczCjQYMN+TzAlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0MSBTYWx0ZWRfX207wGtzy2UnV
 CA6A4Dk/TeyvQSpk8Rk/d24xPBXR/pPEYJCfMYuviHUJeFIMM29+jdYpzr3egaz/3k8UNsMIt6W
 cULM6nUykpZ+MMeJrkftj9AXDB4sEyquYR3A9AdQYwtvGjS+p9jgwz6ar54AO2wYBVED/OVh957
 sNKypK5tMkcpMW/6GpXhF71A4Qov8Fmy7b074g+5Xkd863ttsqMagnRzxQAlotUqbwyUkS8oPy9
 ZIvSeSp2n4B45hHWghDfIv60eAQpm6GKSDGGqIkuqhxbtqObHD2pZ2ZwbTxhAlpT5UNHQJkUyoK
 bCVriDp+5XPTKrXY/SqEVCmI1OWDwT+JcRjT+Xdi6berUsweOr0MaYbmjQ7XJYJ7cNonr7p23n2
 vV6/fHfbi7DlBayd/IoC8hRGhwN0CncFIjdZP4IItaljn8F1rFFIU4r6MPjZZLvfEMg+sMdcUfk
 +t8gfveLD9vJJewNEHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190141

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-kaanapali

for you to fetch changes up to ab176b48adb97596630110ac58e8a540f07a3be5:

   qcom: Update ADSP firmware for Kaanapali platform (2026-06-19 
20:16:39 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Kaanapali platform

  WHENCE                      |   2 +-
  qcom/kaanapali/adsp.mbn     | Bin 8311880 -> 20388040 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 175928 -> 184120 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
