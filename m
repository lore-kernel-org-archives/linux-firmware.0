Return-Path: <SRS0=rTTR=ER=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E10CD98F2
	for <linux-firmware@archiver.kernel.org>; Sun, 21 Jun 2026 18:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 978541F00A3A; Sun, 21 Jun 2026 18:34:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782066851;
	b=gItC/TwBnI9LTeAdQQ0oinYOR9qkQdUgZLDeTanov9ND17S7Z9LilBALPzzalG3vfuBw
	 kTAhry86S38VTxW2TGC+iaE2jgQ64TrpmRW/zQ//6kXXItMLr0MBNJbw+syQDInPpsSxK
	 wzL3gIG1yvtew90k77EPo+kiAomk32Nv/72isC+DrgVbnnD8Aq3v2t8lQvdpId9aRwtkM
	 RO1cV1MkaKM/GDAQmjTeI2OsduT0xrEwxwUD1QDRJOXOEdHG43HYzYR5ZskoPISnwPsU5
	 UcLUfGmt3WwglpYuPrG8qTJsxVfeZNQ9VXd6MBHExmr728V8ALM4rrffRssl/PKvvhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782066851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4PiCcsEiObXUhu/X8h8mDO9MqortwP9NiOsy6CEfHgY=;
	b=lIajQIr2gcIQEUcVc7AzY54XVxdKX0umnHZGuenvGmDFdP4zfCvaKorF/DX9G1SgHnmW
	 FBiTwTPjwxK1eDRggdeYt6paHBfe/IHtDO7fkJ3s0BK6tTidY9H4ajJbQwmHIIpbNX9HU
	 SB0BnaakExcka0YnbQmSzrbkbmUZTKqLPPNYIBWrs0ZPWZg1omTLnzwGzxo/ozzuqyStf
	 fRp+JDIh3rO618hnadW8c7uNB+uV7tYII01SRk5MJ8rE7i0k8b8mcsPNOB98TsJhcibIN
	 8tgt6dPOakWtkJtddTcIiOprw0iTgjx6m6Rea4/+LoHeeAWCsImuMMEGy1tfXuOUnGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fqgxe/Oo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRaLWdoD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC9F31F000E9
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:34:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqgxe/Oo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRaLWdoD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EC9F31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LEtUNR2141801
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4PiCcsEiObXUhu/X8h8mDO
	9MqortwP9NiOsy6CEfHgY=; b=fqgxe/Oon0k8dyJUwDvhP32eL4N/WsiYWhixP7
	1KDkx8cyfTGYHV/LNaUHEexbzhpiFschcFhzNy1OxmlSHkYDrn+7aa14CoLRSt6U
	vY9z7eNDWcVI34t+t7sboYAt8GTherxR58PSPuZAjjZDKbffMFAWDKS5ivUyDPDF
	uFYF6OIGJvP6ILxBYHoKnXu+vkifnTbwJRW0hY9MjR6ZUcnpZ6neaZkEGs4ZMMxz
	23+x0tZJRBK9B/Y0walvHYb17Kt+6rYhkn/1A6wCx1pKagYaAnifeazfFy60BT+o
	fwV29acR3wnVCgzxMr9hKI7Hw9iCA8a/s8B4Bk/6DEgjzKkg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjebvq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:34:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso2373464a12.2
        for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782066849; x=1782671649; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PiCcsEiObXUhu/X8h8mDO9MqortwP9NiOsy6CEfHgY=;
        b=QRaLWdoDdh3XLhi0EddlaMWWevuNPU0LZYSppoORYIadImCoz811s03ljCVZ7+DKZw
         8qepc2BX1//FxZiGzjzsip9c6hTL83J4YxhgWmCJpLOa3xRp4xUjOrNIlWTSYuF7g1gy
         6QiQXElnU/2mndeMRPYI8kC/iVfhHifiEhGKUjPPL03BBzMd776LG9pRQsNNZadspThD
         zE8kiNcojSrKi/pvzyAZ8618Wbz6e77P1l0U9jcJz643QkWPSy1i3qrI38rSulvAFH8a
         T+kipuqUSWHC5b6RTd2QcfNJhM2gQwVEPnbMyB25ppSj8dtlKxmnmWCKLUmT8r2iMKwZ
         dIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782066849; x=1782671649;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PiCcsEiObXUhu/X8h8mDO9MqortwP9NiOsy6CEfHgY=;
        b=hzkHZPJkjmiwMkAxSBkJtG89i3x0vQeUa4R8u/2+F+ES4NcozpHOKk1qlZFuHvhVf/
         hMQHbsW8EIUwL5bA1v1cavbt6PW2Me4DQomJHydsrwmfzHe1xmtYmrkS+A9PeSNpqrYT
         6T2cbBxr96aoVvo+ad63RV8oSf+5Nb8SnG1Hrky0XY/WbLCYJnc1droZNF2ck/xJiy7/
         zYBW/IKMshOjbtbe2eKBx/EMRHGNHn8cQK1kGORGIJAoFKdcC2BY8IZ+5G1xXQFr3z0f
         5OhDCc8m7Hxeb1MV1pVj5bJ0sxKrQAmnVPokZMBashiwbV5AgptGJn+Iocfd/1g1h7dZ
         xvcw==
X-Gm-Message-State: AOJu0Yy0qJV9VLzYtOSL0VJvijsSpOrFvmJieVsZYhu4ow6ZlrZDJqSS
	VfKgmu3KRdiWb72W2Ya866s4o8YqWAPgVKkJya1q4LA5QneTL0Jr+yYBkOv9de+rybjYX+Q1MpW
	9EgDAEIgQrDz3i8v9VUthtjZ8aDTd15zySKf3R8/5pPqUUdirSralKOE2yPJM890OMCjYi0k=
X-Gm-Gg: AfdE7ckh6ubIlU/vWa7DkTa8VeDHzcH9wFs9/1yi8D/ebvUOVsMVBkAE5ABG7Nu24F7
	IyUUoco/bylEjJFfSlFypeAvbqB6dL/DdOGWRRZ1h2ttQIqkUuMMzj2ehlzVigBO51XPY5ar73q
	dkl3EmfbhZLKNHyDS3Ppey2Wu0ALdDRlh9Q4ddrAO5Pc2IIJnAypEZ6pDp/m97jq1eq+AXRb8Mk
	l8S77sr0ChqRxhAUbhq8V3/X7JBr9sqkoSYEYgC1F/Wn4DOMojYBpOs+xXok71FT2AZJLooHWQX
	/LLL5OjSA9UuhHR4HzW2aagZ8Ip3EtuU4TSzBPP+ICCIwvWbqGx65lxgW1FevQmRJtwIM85wLct
	JP2nTXhrdB/Nwx7QNgTzPihI/GtXMXiccrZEJUj5/
X-Received: by 2002:a17:902:e744:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c7422c239emr71891265ad.1.1782066849344;
        Sun, 21 Jun 2026 11:34:09 -0700 (PDT)
X-Received: by 2002:a17:902:e744:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c7422c239emr71891065ad.1.1782066848830;
        Sun, 21 Jun 2026 11:34:08 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8d1dsm55596085ad.51.2026.06.21.11.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 11:34:08 -0700 (PDT)
Message-ID: <9fbcaa15-2bab-438d-ad7b-24c2acd77d11@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 00:04:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fQD_3IjayjW3xSIXH-W6w0XmiBGiVXyy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDE4OCBTYWx0ZWRfXyptFQfmoIPgj
 JhKfbrXqOuhm4iZrA/WZkEdt+zdLlCBpwi8uHW5X+y4h2B+7pzBY8VFiWPW60+Q3DiQsWBVLd+C
 vvzAvgaHW2P/hyhz5mNr4QS4su9BsPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDE4OCBTYWx0ZWRfX4D0fSLM91Ovb
 7DN1wfgYUExqNuPQuN3ruAcenchLjHtch6OVw7r6kfBgI1yJcd30ZxoFjr/D6KtPbLEgPZ6PJsE
 PMXcMfNmD+LqpD6IlOZv6UkrXqeNJrUi9M5wh8yYDPn2QcIf5yIzNcg57KW0QqAAX0LllL5yxIm
 TmtzCw3D5ufEERrOGa1QRkJrD0gkPfNRfOQB9mnqSNvC0t1VzUBx/bsGDvCSp8FdWP7Gpglqiyz
 tev9aoKATIPq0mxpSXdtiNzBAE61bA+loQ+9EeXU1NjsTuuBEgzSLCGpbHYBAm9SclyeyDNRv4T
 OmYqfCx68sfYZQqbkQcJcjyAH0z/l4l49F6cuNL9347k9qwaZ/ZdD+kbUEW96s5K+8q3f4oQQbd
 9rFEbfmKMRRg647HOp/lCMgia0+iNr6Mdh/WmipDxvcEBbSmSVGh9zaDxYZRa92kHv7zBjEzmYs
 IxY8wbKbf2O1kxMdNkQ==
X-Proofpoint-GUID: fQD_3IjayjW3xSIXH-W6w0XmiBGiVXyy
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a382ea2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210188

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
riscfw-qli-shikra

for you to fetch changes up to 40c5a56a42ae319d3ac8aca0d4899f2611623d09:

   qcom: add LPAICP firmware for shikra platform (2026-06-22 00:00:35 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add LPAICP firmware for shikra platform

  WHENCE                     |   4 ++++
  qcom/shikra/lpaicp.mbn     | Bin 0 -> 1346527 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 0 -> 37808 bytes
  qcom/shikra/lpaicpr.jsn    |  14 ++++++++++++++
  4 files changed, 18 insertions(+)
  create mode 100644 qcom/shikra/lpaicp.mbn
  create mode 100644 qcom/shikra/lpaicp_dtb.mbn
  create mode 100644 qcom/shikra/lpaicpr.jsn
