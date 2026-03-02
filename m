Return-Path: <SRS0=iYdG=BC=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20C0D58E62
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2026 06:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76EDDC2BC9E; Mon,  2 Mar 2026 06:38:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F910C19423
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2026 06:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F910C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Lk2T82167498
	for <linux-firmware@kernel.org>; Mon, 2 Mar 2026 06:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qQt+68nfmMY+a54UkVa35Y
	hVVQgLT77pvqhjODDVf6E=; b=nqSvW3+h0cM8cIDiHlQrWrY22LdQh8zglCP1sY
	81dJsh7dJFaOIDpBPoUcIMynQcswOZEsHhX6rCvHDHLYAAyyar21ZvxudqkO+fXe
	OZyg+nyOlawm7JhUrH6bC+ElGyTof/g7xf+7kdEocj9zf+j6irL53IHun6V+S4f6
	NdzXQNK7ysUQMU54zQuu2CeYiPoYq3UwAJts/gcXf4TKA8bsN+m+5ImGDp34NkKl
	Dj/M0NmOKWG+5b3wV8wd1DAv7bjUmL+Nk6vxCBEFTaiI9K5wZaGJ+dU3oNNCQ/OH
	yvCFalspmuyCQFe9EidtEsF5QAf9shbRq6P2JnavFdqQ1N+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg74777-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 06:37:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae415b68b1so16597765ad.2
        for <linux-firmware@kernel.org>; Sun, 01 Mar 2026 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772433477; x=1773038277; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQt+68nfmMY+a54UkVa35YhVVQgLT77pvqhjODDVf6E=;
        b=fYkumhH/D0uXst7vN+smxdu4yP3mqiAXUTAFHoM0W1BBjj15+6HvQuSOXqQIgFHGfl
         MSOlvV4jwvYsVOz5oJl6XWVM9N/SZ7ZRsqiJB+jpPb1kHMtQhXhEbYCs4xcthwmUo3sX
         8tU+3isrAOE/ULCwdiRb0PiNkHex4+ILIBnWdLx6uhPb9vjCWA+teSAhFCn1coh0ET5b
         ozUTJpnNkHTGtfeX/NeUeMTM8smule+coOSV5PrjkSvSyrK4sCXLYeR77Qlv3C42NIgr
         /jmY3BBgIXVDuUx77HQ0Ret42A4UmmyPu0chxk0s6xsdnDJotZChWo/aN38GmcUZCchZ
         IDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772433477; x=1773038277;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQt+68nfmMY+a54UkVa35YhVVQgLT77pvqhjODDVf6E=;
        b=Qvgb9i5rrx4VtWSTHQ+d65dMk36heMb2VwDPSYbRZ1nPP8kovGtJ4NOmO/YhOqvuro
         vPWwETZr/OYBT8GxFPp3/n6rP7EsBhh+sHMr0O3YPqkqId9B1Yd8xOTrXN623D/UUqyA
         5aCmj5NzFsKqByZgDl+Z60LDwtDVl+7lrSq5ToLxf4OfWtSl4Zes0dKhxqKYegD3TTC8
         Dvqz3smY3LdKCVvBHchg5/qh4a9ncBoAdLtl93GC4UXDlWKWmE3DVY10Cwy12+hP1aih
         YF0xTjN7+FjAgNapXEiJ8if9p+5XtDo1UC7msrp/o+ogr+Vc1laKm1k2ffFrBUYrB5cF
         hM7w==
X-Gm-Message-State: AOJu0YxP8DOIdEAcvcxvcSmLxRzPyrlHNjuNJirtLS+22sRa8XSiwD/3
	UObNW2M5t6xi4jICt/g5QVnWECS0pQ7AM/U0gBop4P0t5MJF6hSUCyjyHxBkqkkLM6PhK0Q8i5k
	lhr9hkiHwYinT50BAQUgYVcTAkPr5ngyzUCFnR7Zo8sP5iUZclBzBY08gK3vzVVTYipEmX/E=
X-Gm-Gg: ATEYQzyKXW9cOR2n3Rn0JryQ7Ba83rTzB2qE2LTBxJ0OvxobfX4sUWiGDBPMXX/6ivF
	mBYJVcI+BsTK0cnlMgEtZJZJAr7uA0nqA1n9eziZwWb+zipTYdcbsoSisj947vM0BICdFfYwHdm
	6bo+UE4GIsSqv1NFgFwHZhXmzSUTZjEeE/jRwYxh+2EkQ54HsuQa75DsjpUK95Hq6Qm/QGtskcI
	D0B95xvqgPxtAjVbOCroQWT8NsFgd+zi910sWCDFilXm/+5XoqQ91NyiMCOeNZsMJoMsYnBMu0R
	tgLDwTLtLNkN+GV6CFQa/FwmVXknFTOcKsmGcRJ7w2RqEWlhu46a5fxapSAKmktDcP/y020tnxt
	7ZOojPOt3RIw8MOAX83Il2I+Sz2zzxE135Op3/DXMK479jfvRQGY=
X-Received: by 2002:a17:902:ec8d:b0:2ae:1f67:417a with SMTP id d9443c01a7336-2ae2e3cc288mr111680035ad.1.1772433476704;
        Sun, 01 Mar 2026 22:37:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2ae:1f67:417a with SMTP id d9443c01a7336-2ae2e3cc288mr111679645ad.1.1772433476167;
        Sun, 01 Mar 2026 22:37:56 -0800 (PST)
Received: from [10.204.86.153] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff325esm14739642b3a.37.2026.03.01.22.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 22:37:55 -0800 (PST)
Message-ID: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:07:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for glymur platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t_Pvqhnbtk9WXo310j9hPhOPeiE3ZApu
X-Proofpoint-GUID: t_Pvqhnbtk9WXo310j9hPhOPeiE3ZApu
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a53046 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=D-8PlWYcEa8unJ6-FW0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1NiBTYWx0ZWRfX4kHkvStpcCQr
 mTUtt3PnxxVXcBYsjdwAeqfrghdAzmKmBDMlOIUNVhboGXBaLNhU1aCsxTzwy4adkGvGvU6OgOt
 9ATky/5XPUSwaNpg19fPf/ol8zMKDUFK1LfHCwnSB3t6xraWNycCko01g85TXMY8f3PQMqLGHT+
 /DaIYSa3grI6G+IBxARu9q4J1Mo1gk8Cz2VcX1RI/depqF+N7P9wD4WHMdMtmMGwDEKLbfhFQ4p
 wWuBb25zu6mh+vcho0rBVA70Aj85j872qVA5MplZ1yLvEvM+vANis8VDG37d/MXVYooXWReVY7j
 VMjys8OMOmCcTiRy0ZOY31deh4Go7oIpKbhmrLgWAUv/NpowHx0LZh30hRX8QrqaOX9OBDVfjGg
 FUsHSX9wdQ1us+avjWoe3LeV82/oUr6G6N4CoApXbG08CnkhKWPeOeL6fEbu+Z26QdvqXUGBfCg
 fHg3LBU7HFFHckBNBvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020056

The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:

   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-glymur_adsp

for you to fetch changes up to 6a7534ae86f1932a0367f332741c06337e550eef:

   qcom: update ADSP firmware for glymur platform (2026-03-02 12:04:15 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for glymur platform

  qcom/glymur/adsp_dtb.mbn | Bin 7253 -> 233272 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
