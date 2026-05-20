Return-Path: <SRS0=F5AI=DR=oss.qualcomm.com=dishank.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECDCCD4F3C
	for <linux-firmware@archiver.kernel.org>; Wed, 20 May 2026 08:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1171F1F00894; Wed, 20 May 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779266305;
	b=CHLD2lALNYIVuANmJjdn3CrR7l7qHcoXr3+8EalrzpnJIczKs+IwiOUNuwSz2NCngXkl
	 X3nCK302E2epjfCR0Kcw5WJ1PWP7/yytmwiadJfE1VD3qoD4r/32NWq/uHdaKWImTVAG9
	 qPSlR5YgxgaJxtgA2ODq4xKLOCcMpzZwCOlHIVxbB9j4OZYE3jCwXAXemShydcpKNOAot
	 HtnEYYXIWkJS0o0XQhffo8dlCyt1kS5ylqQj7cF4U6ARuMUVDNwyOPMo9HB6MtSL1NgJw
	 Q+YOtB/1iD8tIdocchfFCFKXqXNAh3Ywnyi8RqoISfpMhtCgSSiod1uqbQnQj7ZsyeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779266305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Content-Type:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:List-Id:To:Cc:References:
	 Content-Language:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UZFNiFjIk7YND0L9DQw77RQVQKLaMtzxfvCXGFvsoCw=;
	b=yZDwVnPuVWx0V+n78DkLQ4zZgg2j9Yu2WyaHTAeiYorjS2KhvPHqo1aYxzDA2rsZO0mR
	 pgqUzalOd22J6UKIgqQ+zlMhHSyG1HF5etJj+8cS3KgGRAny4dCFWr9Ml2uw8D75WVChG
	 qAh1k39/ONpl/LcSPMkLGjdvdKqS7FYEnF6nwUopKelYIdxVhE9xFp+Adxt/q4PdE+9bs
	 YamCu3BYd9eHUtCivXBM8fNBTHB9fNFjZ4NY362N+h0N63mqiyhqh35h+5WR0tp6dMXEG
	 0+LXPx3yFQ5lHotOJJQ3Xa6pAtYv3cSvt1F8GTgV4QMA/9DfIzFcbT5oWwWlyMfog+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDntwjed;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtvJV0OI;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D76D1F00893
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDntwjed;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtvJV0OI
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5D76D1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7lOw51963815
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZFNiFjIk7YND0L9DQw77RQV
	QKLaMtzxfvCXGFvsoCw=; b=BDntwjedH7xswO6tWrUh64smyISvzGFWU5NiJsrD
	lvPWjVM1mY/0WZ/uXZ0YXNA53F6GsMiXneqp5WojTFiW4J7hQN6a/trnpAEYBMc+
	XFZuQpyBzkGI80Mtv3/EyOH4EqVSBIHUIp6zKBCmy1tqQxNoX2PeGfQxszOEOTDc
	Vk30cmhLjCoT57Q4aplkrvGejX2g4OfPucuDDkXE4Gon92mZmIx44YOKPuyRXgvG
	zUsKmXB+frr8wCICBQ/TCf8YSitAFYTlxzsdIXHdObXI8DBnHTQ1ry/EnMIs+IYV
	dmA01rJjSYVT/naQ5cVFbyM9i2DWTJV4o3CzdxYjCDu0Cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3sys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:38:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bdaf8567f3so30201525ad.1
        for <linux-firmware@kernel.org>; Wed, 20 May 2026 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266302; x=1779871102; darn=kernel.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZFNiFjIk7YND0L9DQw77RQVQKLaMtzxfvCXGFvsoCw=;
        b=AtvJV0OICjKiJX4LD94dFGBfAEHAXmBNUMJ6WFjPpyD5dwAeA53f8DJBMDYry6NVV3
         IKKac9EXG6BEvs9g69fGGgIXEdt8sVUvKFT8rt6Bs4Ml8HVDJoEs6YEw9rwNTui8WsIK
         B8z0XF7fjUwZCtzlx6IFyKGTxX+XSlckEtUiqcwrEtdYy5kv5OzvMI0R1cezRS9SJBwI
         Kzp89rhe4ABWcrQdAZAOUIR3faDvkfb5i6jv01YVL24mNMx2UE1vTSMSui6fazA3HKDx
         LBYzt0h27aufNyEx9q+b0m3uhrZ5BcWB8yMzoey33Sr+rH9T6DR5VXHhqFrZvVkGca9M
         V68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266302; x=1779871102;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZFNiFjIk7YND0L9DQw77RQVQKLaMtzxfvCXGFvsoCw=;
        b=hvIh8jhncR6DLxkU5tuT9W40ab/xAM2xcarbYEGFa5qGLqfTeBwIZWsffJZSZz7rgC
         6meyQqCBxNStdv5vFr4FzWQzeMBEk2N4RGCZJpaXkPq3SSgLMSBsY/Cswq65xJfWH6bq
         8fFktfHJbGP6trD4khnDdFfLlv6IzhdtQibJMl7Etzy/6gLyuVwQmNqio+Zde/RSCgUT
         gywc/tpyxKKmKXWJ8Rr3EXZnp2g8uHXyCiPBhBpdzCxBPQYZN9LBPHJsHpG45Mc+0/ju
         EYQSvSEupis2N+27pi9Uhd0tJI/7esdqaa+KX7iX26CffO6twHDHs9SBHdC2ahTeNoRX
         PsCw==
X-Gm-Message-State: AOJu0Yw6QSqKjthHZiKupkHwWpAJuCP8FnHGnl4l1Y1n4X1QU8gYpS8U
	sio4m7bwPJOWAzRhXIBySfhvo+3TeDnyT3V9DU++3XH1VyP+/H3WMOx1yES0t/wP4/qlS468h36
	9ks4ohBVENWVG37+4Qf90p07xo78Kj1yodyRjF+fP3lsjP3gWDRo5VLD1Qbej6l/eH8htzFk=
X-Gm-Gg: Acq92OEtgTFmHVgk0FrD3I4EyxOzYV3fUpBKHGX4EEbf5KC7T41XhEvxY9vMx0Mwnb2
	HONc5RIjls9iL4mq/HdYh62tfL6yiSLQgW6PT9Qysxt7SiXlXu/FjpvyLq9Lzg7aTdwzOxKRlF/
	aQIGmCqQhSZ/oh1/wV7nqTLQwPPuC78hOlPblTPDUHc2dccskJdO77B3VI/4mP7wcsDDZClvRHI
	pgY3zg0XjnX0Nb0jDZVXS7wxXS5NoelaSKP2T0elLJECNUvowbAeZvbEN+NGUakYcXhYIx08uRL
	c59G2A64inPI04yYZ/SQ8Nbg9syJo71YLgLyRNaKbz1UgmdGmQJ09SiS3bRDGsX5cnKjPhb8JvN
	Zliy64wZTlg9myEOPiNF0/PwS0OyGI39APPe0Hj27zICSQr0R
X-Received: by 2002:a17:903:38c7:b0:2ba:4086:ef93 with SMTP id d9443c01a7336-2bd526f9d9fmr222262835ad.10.1779266302012;
        Wed, 20 May 2026 01:38:22 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2ba:4086:ef93 with SMTP id d9443c01a7336-2bd526f9d9fmr222262605ad.10.1779266301490;
        Wed, 20 May 2026 01:38:21 -0700 (PDT)
Received: from [10.219.1.40] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe498asm216146955ad.39.2026.05.20.01.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:38:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sFzryQCael5BHxjVF2I3UAOQ"
Message-ID: <a882c751-20c4-44c1-8e2e-ff5827086d35@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:08:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Update Bluetooth firmware for QCC2072 UART
 interface and add BCS calibration binary
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshkov@gmail.com, hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com,
        samana@qti.qualcomm.com, ysiddu@qti.qualcomm.com,
        dishgarg@qti.qualcomm.com
References: <b5daa321-bcb1-43ee-86f4-112a22284663@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b5daa321-bcb1-43ee-86f4-112a22284663@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ozHhgUJ0OPFlB-i3XdN8UYwliqRBNdE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MiBTYWx0ZWRfXzOdCu+sWbCP1
 0DbYdG0UeDpRc6zQBxvQPOqPt1hldqLH1rtnorP9RWKpZDTsl3U10xJnDR2esQrWumVeEqEmSLy
 oqA9N/U3e2emysg3j72xqbj6cPCS+we4IEuFZYWYBsSlgjkgFkYlpfBh/lnR+e9mI6RbTJJVuOd
 Vu3jT7T/4jGh9CDZlR4WDq4CdmqoAzp5VpmXwBwcAeiirr6bqgwVm/wUblmlLrLErOESWh54ekj
 xAgDD1T/+uXJs+sreST9AEiohbod/v2YguD+hoANiUW6xwz/28A20udmrMNmBhA3SCLtlpC/1sN
 Qpcs7N6wsPyNqCv5br+M7PXtONHe9nl8J8LEiupl0JpmpKKny/9v327KZJgFOb429yUnKnWTBRZ
 Ott4zk+DedgyTXbxzHP/KbFGD6Oxa+iPlaZ1ijTwPCPzM6CZrXvJ3e4iNR5+v5+YSD25CbDHdkH
 JOzIxtNj216mzFNyKdQ==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0d72ff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=p0WdMEafAAAA:8 a=MbO4rPEFltebnUvAUssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EUspDBNiAAAA:8 a=cUNbeXwlQIWxtL1d-A0A:9 a=2jH06JKKOg60GhWC:21
 a=_W_S_7VecoQA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ozHhgUJ0OPFlB-i3XdN8UYwliqRBNdE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200082

This is a multi-part message in MIME format.
--------------sFzryQCael5BHxjVF2I3UAOQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

As per the comments, we have created 2 separate commits.
Here's a pull request for Bluetooth Firmware. Please let us know if any 
issue is there.

The following changes since commit 162675c38b9d10e4956531b755a9c015a569daa6:

   Merge branch 'amd-staging' into 'main' (2026-05-20 01:28:31 +0000)

are available in the Git repository at:

https://gitlab.com/dishankgargoss/linux-firmware.git HEAD

for you to fetch changes up to b9a8e80b5561afa1a10666dbb942e4ee2aae0c7f:

   QCA: Add BCS calibration binary for QCC2072 (2026-05-20 11:11:43 +0530)

----------------------------------------------------------------
Dishank Garg (2):
       QCA: Update Bluetooth firmware for QCC2072 UART interface
       QCA: Add BCS calibration binary for QCC2072

Merge Request for the commits: QCA: Update Bluetooth firmware for 
QCC2072 UART interface and add BCS calibration binary (!1057) · Merge 
requests · kernel-firmware / Linux Firmware · GitLab 
<https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057>

Thanks,
Dishank Garg

On 5/19/2026 11:54 PM, Dishank Garg wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for Bluetooth Firmware. Please let us know if 
> any issue is there.
>
> The following changes since commit 
> d962a6a309b78778f458dc94713845eee105be14:
>
>   Merge branch 'mediatek' into 'main' (2026-05-19 11:33:36 +0000)
>
> are available in the Git repository at:
>
> https://gitlab.com/dishankgargoss/linux-firmware.git HEAD
>
> for you to fetch changes up to ebc6ac5cd8016dcbdb93700742f7861644ef25f6:
>
>   QCA: Update Bluetooth firmware for QCC2072 UART interface and add 
> BCS calibration binary (2026-05-19 23:23:29 +0530)
>
> ----------------------------------------------------------------
> Dishank Garg (1):
>       QCA: Update Bluetooth firmware for QCC2072 UART interface and 
> add BCS calibration binary
>
> Merge Request for the commit: QCA: Update Bluetooth firmware for 
> QCC2072 UART interface and add BCS calibration binary (!1057) · Merge 
> requests · kernel-firmware / Linux Firmware · GitLab 
> <https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057>
>
> Thanks,
> Dishank Garg
>
--------------sFzryQCael5BHxjVF2I3UAOQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi linux-firmware maintainers,<br>
      <br>
      As per the comments, we have created 2 separate commits.<br>
      Here's a pull request for Bluetooth Firmware. Please let us know
      if any issue is there.<br>
      <br>
      The following changes since commit
      162675c38b9d10e4956531b755a9c015a569daa6:<br>
      <br>
        Merge branch 'amd-staging' into 'main' (2026-05-20 01:28:31
      +0000)<br>
      <br>
      are available in the Git repository at:<br>
      <br>
        <a class="moz-txt-link-freetext" href="https://gitlab.com/dishankgargoss/linux-firmware.git">https://gitlab.com/dishankgargoss/linux-firmware.git</a> HEAD<br>
      <br>
      for you to fetch changes up to
      b9a8e80b5561afa1a10666dbb942e4ee2aae0c7f:<br>
      <br>
        QCA: Add BCS calibration binary for QCC2072 (2026-05-20 11:11:43
      +0530)<br>
      <br>
      ----------------------------------------------------------------<br>
      Dishank Garg (2):<br>
            QCA: Update Bluetooth firmware for QCC2072 UART interface<br>
            QCA: Add BCS calibration binary for QCC2072<br>
      <br>
      Merge Request for the commits: <a
href="https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057">QCA:
        Update Bluetooth firmware for QCC2072 UART interface and add BCS
        calibration binary (!1057) · Merge requests · kernel-firmware /
        Linux Firmware · GitLab</a> <br>
      <br>
      Thanks, <br>
      Dishank Garg </p>
    <div class="moz-cite-prefix">On 5/19/2026 11:54 PM, Dishank Garg
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b5daa321-bcb1-43ee-86f4-112a22284663@oss.qualcomm.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>Hi linux-firmware maintainers,<br>
        <br>
        Here's a pull request for Bluetooth Firmware. Please let us know
        if any issue is there.</p>
      <p>The following changes since commit
        d962a6a309b78778f458dc94713845eee105be14:<br>
        <br>
          Merge branch 'mediatek' into 'main' (2026-05-19 11:33:36
        +0000)<br>
        <br>
        are available in the Git repository at:<br>
        <br>
          <a class="moz-txt-link-freetext"
          href="https://gitlab.com/dishankgargoss/linux-firmware.git"
          moz-do-not-send="true">https://gitlab.com/dishankgargoss/linux-firmware.git</a>
        HEAD<br>
        <br>
        for you to fetch changes up to
        ebc6ac5cd8016dcbdb93700742f7861644ef25f6:<br>
        <br>
          QCA: Update Bluetooth firmware for QCC2072 UART interface and
        add BCS calibration binary (2026-05-19 23:23:29 +0530)<br>
        <br>
        ----------------------------------------------------------------<br>
        Dishank Garg (1):<br>
              QCA: Update Bluetooth firmware for QCC2072 UART interface
        and add BCS calibration binary<br>
      </p>
      <p>Merge Request for the commit: <a
href="https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057"
          moz-do-not-send="true">QCA: Update Bluetooth firmware for
          QCC2072 UART interface and add BCS calibration binary (!1057)
          · Merge requests · kernel-firmware / Linux Firmware · GitLab</a></p>
      <p>Thanks,<br>
        Dishank Garg</p>
    </blockquote>
  </body>
</html>

--------------sFzryQCael5BHxjVF2I3UAOQ--
