Return-Path: <SRS0=Iq2n=2O=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9F7C87FD2
	for <linux-firmware@archiver.kernel.org>; Sat,  2 Aug 2025 10:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80691C4CEF6; Sat,  2 Aug 2025 10:24:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3499C4CEEF
	for <linux-firmware@kernel.org>; Sat,  2 Aug 2025 10:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3499C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725exur007534
	for <linux-firmware@kernel.org>; Sat, 2 Aug 2025 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=hb8ZR9AEDOBh5AZqMQg/QId3DNqCgtCeOrb0EIcL6C4=; b=bv
	96Igv1yDbZ5rbevBdQTlrC5EFCKbKUP/4cIar0tIlds9Elv1gwbxIFLdT8IV4VUo
	7Quon9ZmTXL2VittXEYfO2juVoL1TMzvpxKRVd56eOV+IWL8clrrxnOepdfhIsim
	o55d5R9Plnd+77YThRtsDrI5MyiM4CLGtJvDrGyokVH5OBuhDuxkihuw/1RMeWwl
	yrytYr22kMODrCQozaKZ4wKImhyHy0PTPRn9g0J31LPXl0QNEofhaMYEMldSH44k
	RyFHqRt/EOQ2MuQqbcKwC0jpXrGDC72tP3Ou+ylbFk35pj7ttDhlyfJG0JdZSLXr
	ox5R0xh9mAo2ednXUMpA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a0kq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 10:24:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b42464016c3so539378a12.2
        for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 03:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754130289; x=1754735089;
        h=to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb8ZR9AEDOBh5AZqMQg/QId3DNqCgtCeOrb0EIcL6C4=;
        b=kodbhSQwy0q4kLHTfPwfxQ/p5SKCrtkw6eXis1CoE9DizZELJx4NEK21N9lMoq+cDu
         VLpf1dPKA4TN95NiYGN8SZookKEjZGUYrH9Ku6q4PXYWb1Ay4YgKL6jaGNJk9h8pCUec
         duZGOGO5UGZR8aabgM7FTY7SR13H8RqYwoKXXKtv7ZTKRfX6ZjT6ZJJuIBLrvwOIU+GJ
         VC2W5CNd+9IHUHOZrA4EOMljm/b3PrfNjeY7qcZOcDqNHBye1HcRIM1T6/4rfsyGp1ho
         vt67jvdxiXgknWTDBmty6jQOufxFUIkgDKM71Itv/mOtcX3bE+ENpXUCx24vOKPl8gvy
         sHjg==
X-Gm-Message-State: AOJu0YyNV8jFnIxBUEeHBCedG1Sp2I1etI6xnCHFlpeZSQd4jLGHULjm
	rEu0fnHvSLbEf0YpPvY3JlBidSnB3/VpDEzHWcdG9f89Yi0Hkof56G4zxgxAA8/VssWRLjf18mq
	2xWL9W5/jlGt/Rh3AQSRB9Jjqa13xmSl53wSzPurx9Nk/ZsOmZ8eE4HiftIZRCrIpUigRZHI=
X-Gm-Gg: ASbGncu7DCQCYDH5NfKB1Ei7qFQ7k6yZIAq0oxH6W2ovZ45i2UxVebiB7QWcrJz2V7M
	tJ7QIpjD8V26suM0E0pSEjKQXaS9m9vHyupmgwt2JJfGhZ6wvrLTNNcuHol3/dwnaZGJL14pyqU
	sejbFF9GqiQyrxfCzZ+hbqDml9o5rSrcK/B9zU0cx6ZMKxy+2gLqZGIjBipQVsxHxwC7lQHFM1Y
	gDU+FKdF9/k/q/uTiQ56F9UtjIl1RnUpNveOhF5MFRBAEYGler1EsA/UZbw3jSOHPk3xOn98VuM
	ScFhAUIhGTnb9fdFU5RPtdbW9KDUDeawd3N3zwuvT2qaip9XQ3hcRcmIwfzJsRTvmIse/ex38g=
	=
X-Received: by 2002:a05:6a20:9184:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-23df8f6555emr4981509637.7.1754130288810;
        Sat, 02 Aug 2025 03:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1YTQjggzcyGAoyj0NHcyhjiFObTKiGG58jXfmI0fCT+kZEjG3kbSEP+cQgT6Zd80vihf/Yg==
X-Received: by 2002:a05:6a20:9184:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-23df8f6555emr4981485637.7.1754130288378;
        Sat, 02 Aug 2025 03:24:48 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422babfbbdsm5486524a12.35.2025.08.02.03.24.47
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 03:24:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------d8W0aT2wAvC18Axtl10pgFDw"
Message-ID: <57b6539b-b8c4-4adf-a806-d5e4a2da46b9@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 15:54:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: Guidance on Submitting Firmware File >100MB to linux-firmware
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688de772 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=2OwXVqhp2XgA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=l5oWqUUsWGeFsBaidYwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=I6VLw5jmq1atPvPOLjkA:9
 a=_W_S_7VecoQA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Y4Ey1rKZ8WTBvHqLFAx5tYlcYFKXPwqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4NiBTYWx0ZWRfX/yYUY9P4R37y
 bGgGhsTXmcvV8MpLKWCxVms1FZVCu3capEt1NYVuNdEbnTYzXtO4Gjk+rMUgYYuOV1qANVLn9EJ
 PSvT9KGDdfukV877KOTxzAk1jwQX+dbb1J9oarQyeSTBxSaogkswhpX4I3HOn0To3WCAR4Za+aI
 cFrgPXaO7wPwg0k9hCPb5o3LW0XfHWinssTooBRaTCafH5Vn1hbudaDnnD75n12tZQ6kc1uHqN3
 Ovi4apHdG7wUtKCLHFUNYK/xe026Tlukp4Wq9qm6fhfXMl8/T86Nx9Tns6SGL/6K1I6AxRmL071
 tSN+lrig0j01QJSNf5fTYYYI4Vm/LNuN5neJ0KYCmYcu/EG6lU58Dk5nhV17gZ30VSgOcyVn6co
 pnsnuoQD/8VvKa7MyIl8lmfb95Wrb01WFdPuGcuyqYtrSea6kYJiH92RIgOM3wqpoMxNEJaQ
X-Proofpoint-GUID: Y4Ey1rKZ8WTBvHqLFAx5tYlcYFKXPwqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=752 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020086

This is a multi-part message in MIME format.
--------------d8W0aT2wAvC18Axtl10pgFDw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maintainers,

I’m preparing a contribution to the linux-firmware repository for the 
QDU100 platform, which includes a firmware blob (qdsp6sw.mbn) that is 
~110.88 MB in size.

Since GitHub enforces a 100 MB file size limit, I’m unable to push this 
file directly. I understand that the repository does not currently use 
Git LFS, so I wanted to ask what is the recommended approach for 
submitting large firmware files?

I’d appreciate your guidance so I can align with the repository’s standards.

Thanks,
Kishore Batta

--------------d8W0aT2wAvC18Axtl10pgFDw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Consolas" size="2">Hi Maintainers,<br>
        <br>
        I’m preparing a contribution to the linux-firmware repository
        for the QDU100 platform, which includes a firmware blob
        (qdsp6sw.mbn) that is ~110.88 MB in size.<br>
        <br>
        Since GitHub enforces a 100 MB file size limit, I’m unable to
        push this file directly. I understand that the repository does
        not currently use Git LFS, so I wanted to ask what is the
        recommended approach for submitting large firmware files?<br>
        <br>
        I’d appreciate your guidance so I can align with the
        repository’s standards.</font></p>
    <p><font face="Consolas" size="2">Thanks,<br>
        Kishore Batta</font></p>
  </body>
</html>

--------------d8W0aT2wAvC18Axtl10pgFDw--
