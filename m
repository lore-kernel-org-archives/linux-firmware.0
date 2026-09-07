Return-Path: <SRS0=0WVS=G7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F871C79F99
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 10:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F6B11F00A3E; Mon,  7 Sep 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788775972;
	b=Ujj5bdRG+RAPNAsvx2xPFzbe3mba41uvoMIjJ3uUK0czigLBH5htkgWb0FyTPtm0DfN7
	 pGV65BpThKmjH/doW67JtLsiJTBz4rBrq+54AOItvatsfAB5Jud18eAtN4Q0wFGEqbfAY
	 pkAhtuC0sbHjwSET8NclMDm3/srOU8w1xpuYEdyXTyaZx9NIi5Vp1KOaDTpuTY0AYKm5I
	 v04oNP6lsiZXG7ERgsj/F69s2qEjrhUJ566/H2HVyErm7M3HoM2yI/fEkmWI6rwm5uwD4
	 TsRVSjZoHmu6u5qgQaPgIBn9x2z8WQ3AP3CZWCLDF3z2+ibRCkmnh/i/hj0ZtqbsnJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788775972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rx3fNWB/ON77daEHfNxKW+EZL3EUjZs11PTd3NXPmWM=;
	b=rJx/3Bbm02XLyVjg6e/hi8nPzfGTQwM7fC725OAmFAiA68gq4RcXvz5k4panDDk9DzKv
	 ZgLvPA6pUR+bQlf9LMu2Tdm0GllN83G6EqCUrZHnmF+QP2TlZaZPE73W2sp6T7BIsfQn1
	 xfU7XfEShzLJe9lQ3+rPyJLJxKomfdiKFKqE3/qh/urUBkdlDO6bL64WeedmUZRZWlkSS
	 a70IpnkBR198t4DOGV2ojWHq+WbQyDpECimgAO2BJziVmS/XlxR7tJHU3DIBcn/bZCX4D
	 iiOjyAEnULBU3meUJyJ3rWvEGIeXEf39tNkH7ToatldTAPuuAIqUbmpxJvCZ+u+PPag==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGCFKRMe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2LzCuzv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E08C1F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 10:12:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGCFKRMe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2LzCuzv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8E08C1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bnBe3618662
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 10:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rx3fNWB/ON77daEHfNxKW+
	EZL3EUjZs11PTd3NXPmWM=; b=WGCFKRMemO32DIjcFYwj9Q0v6CZ3N7YutQ/Znt
	ZWRZeK4JHNoHruvrzTKMimfutkAoy64m/z3FCRy+1o6JcZI0NV9wYD/RjyTBTvt8
	r3QkG0RWK63TwYB1+WGVD3KWv65BmACFp6KyhOeYCffFtIUJLKW3as9gCvrkSvG+
	oBqLbn4ABYsha9ZSzkXKO7Vb89VdAqkqJsxfUkl6KFBGsZxe9Mg/bklwIu69Wdof
	iVbJ1mHEaMapayjpyLdmcgL/c9kWkCcVGoRMvZbcvmW1uEASVkLEm3MC0aYXNpAC
	XbYYOZKiUalNzTCm/Sn2xTn9h014X4Q6O5N6urllpzQi+wMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygjqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 10:12:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so50144355ad.3
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775969; x=1789380769; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rx3fNWB/ON77daEHfNxKW+EZL3EUjZs11PTd3NXPmWM=;
        b=A2LzCuzv+q57tfTaslM3jfT0L6D10HdY4HAfC6/4+++foblNuMcw7TmZhHaP2VkJ+Z
         kouUbeBO//5syAxzUdXeuNEInZcSl9wL+ZLiUk/0AVU46xXCwJTw2VERrIJyOkOXGSkB
         lLhblrIVhAM1R+ptSfKOWn5hPeYtA0EI3uqatkuhB/LYbIkutte1m0TYLn5yzMqPOQC8
         w07hwDh50MsaTIqYmP9uJUlTwfsKIF0wbp3uUZtvOX0/gcEl7KOpz+HB+prA01/4JlUd
         yWhsJ3q/OLF55+xbpk4qvEBfQFQT3LtQoocM5SfuCOeGIEdHsgwhDcAL7dRUZzeaVA5c
         BPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775969; x=1789380769;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx3fNWB/ON77daEHfNxKW+EZL3EUjZs11PTd3NXPmWM=;
        b=QwXImyAE7LMkre4/iKz9y3FP0HGaRMJMSTow0upwTxhdrXIW9JGY1ybwL259vDOo5J
         7wIkmfA8GzTMam8dzEDb23zF6sVphTUkjMO3mgI1DrcqmSzZ474D9RB+v0z7kNhbRtKp
         zRDbr3MrqFo1bSAzcXaGH9Qz/+K7UlNQyhhuhM5YmqUSASlpIJtsjUg9vKZQiHxxABRP
         gQz3vEZHm6vQXKfqU84Mkx77JJjXDxfvW48k7iG5+MjoDib+2D/VPkAq09Pc2ED0h2MA
         33bKrY+CnsUeohHNaZSVIuNPApDb28utvUlVUodcw05q8OZwL5vtCgxZigJVWc1fqtAf
         TLmw==
X-Forwarded-Encrypted: i=1; AKwUvBx6HarIFHel8jvLmPllkiLovxCPLljHcYJqXgd0UTy000LdL7/AxQNU0EwbCAI+Uulj6hdYg0ACKRx/RN0oHQ==@kernel.org
X-Gm-Message-State: AFuF++nmRVZIemMGLNfKZes/iPnYbgQ7H3UJXYmRhuCGMcLoF6SCcz5L
	bA2spNpNpE5f+NKxAPXVO+LV7DwVrmPPsnxhEINMqnO+svU1R6e8GqPC0oakQ4yxeWKkhTEySep
	dzq/eXpG2k3gQ1VDyUho+jJmEFfsrtmTlaqVQrBUzJVZyLaVCPg9qcpLHp5mR9TU=
X-Gm-Gg: AYBFou05bMfKYzktwxglZhHQomxeUsWbDf6T6JM6S4DlTMMud3TCJ7kEnaaObso2VGR
	W9Ys6BH10iujPBxgIlISWFKHCxMut7J1R3WgU3Nqd+vMik+z5wp4K/I9DjkBvtTq5RMK+uhSAzt
	J7jEySvklGSSG7auZaV6fQzalh8ITKpVcoF1OlcN+yZaLIYYo3LgjPomN7KhKt0xFjyHvZrPPDv
	dSDzDDQMoF/wad2f/FVTJ6eQzv0NoO+vRtiYBfg4QWwY8PSx0ZeG7wKhLdcUWY8QceVMDr2Hi5A
	x5vXJFPUQ3uoPttYQzr/w/XpL1spJdwtRjL3ChZzm9IDgxh5OnGfoPM490giMk7ew/PkO3ApANW
	+ur8qxaEPK5O4uxNc3IC8j4UIiAXN
X-Received: by 2002:a17:903:886:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2db1232f69dmr205465325ad.4.1788775969061;
        Mon, 07 Sep 2026 03:12:49 -0700 (PDT)
X-Received: by 2002:a17:903:886:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2db1232f69dmr205464725ad.4.1788775968575;
        Mon, 07 Sep 2026 03:12:48 -0700 (PDT)
Received: from [10.219.56.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb5f0sm43557185ad.67.2026.09.07.03.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:12:47 -0700 (PDT)
Message-ID: <91a07f84-e757-426f-9ce4-92d5b7af0d2b@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:42:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for QCM6490 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g_7s7CIVuNJlEWnVB2d0J47vgPPxqljD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX0liYfrZmVgQn
 sWtQjKCPu/t2pBSWbTVyw6Sl+pMiv9W9ZQWtpqT/DK7sswIC5yK3d1+IhUW6vTIBBvA+MtuWE4R
 PjPHq4CFHNq4QGptgCUemu/tpBVIypXBdgP66J58fN5GkAuq1nsjqzbLhXWZNutVGEPlKEm7CyY
 dSsFa20mlzF0WV6qxJ0pz7zAC4YHdqTT5CygNsVyMc2USQfiVIp6bIXLCtFG3YJ2AJ/Zw3qhBtH
 pSeXJL88YRRDcw70kkSV6aqCD5kjj41syxZnj9V4TURo8/ImkMY44kXsEEMLzkBL6GRXqpuEWyj
 YyF/stteM9bffJgAE6xW0i0fhWkyxvufbaFs9EroGAoUWVwqzI2W3z66fPWGS/gRb55j6x49BDN
 pFJlsGwGLbAGR8mHeaEGCYbCu7JMzsp/JNcMTyZpWEUr3vg6mrtaxqbnt/Des4sc85P1mgMpU8P
 MKZZ1h4dcaVK4oqF9tA==
X-Proofpoint-GUID: g_7s7CIVuNJlEWnVB2d0J47vgPPxqljD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX7nmjmAaO6Y99
 Z7T3mBgrwkI7dLAkqWwyYVay+xMpG5CoPJR0xf5lKONbVdmXSuwbjEJxcL/zrOZJ4sd1uAcMaXG
 /MtHHTp0JU60fu+pHwFlw6vbvi2ugTA=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e8e22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070111

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kodiak_256.2

for you to fetch changes up to 7659e3ef97b14fcf3784852b53ac4cfebd3dfbd3:

   qcom: Update ADSP firmware for QCM6490 platform (2026-09-07 15:39:04 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Update ADSP firmware for QCM6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/adsp.mbn | Bin 12099132 -> 12111452 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
