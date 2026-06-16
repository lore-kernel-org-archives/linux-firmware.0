Return-Path: <SRS0=szrk=EM=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09D0CD8CA8
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Jun 2026 06:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9FD81F00A3A; Tue, 16 Jun 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781591476;
	b=vbC+cHi9mfRBYifDGrg0D4LjhcZRt4qjq/IEEu+txxF6KWGVGZ8QEoWaHdwUE/ZUBoKj
	 Owdfx82jGEA2cym683b6GfUtpZVejWfJIIqmf9kYjng+3GZtgJ2zLHRvE+ASofS7aPDts
	 tr1RapPjR80XRDZPWRras64Tw8XrM26MPMny2s9iJEcS00rBPCWJwzMF9j0VzKFjPxL3Y
	 5eETT3CZy9f73TLCFzP494n3TzDnTT/jiAXRq3VQPeBqq8Wvnwrii/SOvDh8ehV1yWm1P
	 SVrftXmjS04c/wb8+CfZKUBXFIE3eKLyVtFGhfbv7ns3XYaRqACJDDLEgTVKMBVLW9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781591476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m0Of9ksFHOeniwctOY3Y/jVyNTeMb/iuOKQ516kZ6c8=;
	b=vwrBfTGiQq1NX0PhG8wxMf9tq5PSlMW685i+ePmTunzd3BhJbTbMk0InEGuILmEvnV4a
	 OxWQZ9tdXOtzKRG/Laugev51RDBlW6Hxu5aTRn6GpSYyvWfvdSRSTVZNXTfrJ1J+9q+WJ
	 myNVhUln9TNxkZ5NL1sYLlAh5ipxvSXC4FMt7/CjJegp3/CwCzS4iDgHLodBfPwdKczWX
	 /Wk+TkaeHTq8Ih1sX0GgA2AvcOBxJ9ZXNXUDayCC+4hv8ia+oUTdb1MTUxB0hJ3I6nVuR
	 2wYh0yWz2KrDNEUnkeEXrnjo0zEEYtgbYBP98UvgJOwKGBlDIi4Lg03UNrFCDIroVQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OB5MsXMV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeWUCT11;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 144B41F000E9
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 06:31:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OB5MsXMV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeWUCT11
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 144B41F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65Rjr2668278
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 06:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m0Of9ksFHOeniwctOY3Y/j
	VyNTeMb/iuOKQ516kZ6c8=; b=OB5MsXMVDLfNiWzK9Supk5oEYTG7OX2k1k3dLf
	lBJqs8yyGECoFkAwYVJ1V/Ox/HMe6sqrIQzbkT5Cf7GCq4R1Ed4SlXxu53/NSmLA
	emHp6y0iCPxIFP7tJLRqk6Ytk9ThqzAa8JxNYIDuhbhaNdAYS1wOZ4msS3VOB86j
	zUK3S0ZXbXE6M23CvWzFpAbdj4wuiaVh3VZvpdE4GawmXDE4gF3exphD6enWaeCq
	rZ5FL0acexmzOCNdIL7+Lww+Jh4aQ8TUxtKWrWqjePSFtezFJ4jeduarIzJpVvHM
	E0UGKaBcmiu6D1qdJbPG4iKE6iSVDLN2kfVa8elaoc9tooVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx570v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 06:31:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8582b167f7so1963414a12.0
        for <linux-firmware@kernel.org>; Mon, 15 Jun 2026 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591474; x=1782196274; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Of9ksFHOeniwctOY3Y/jVyNTeMb/iuOKQ516kZ6c8=;
        b=OeWUCT11xTErYHQF77NpJrS3FPmOqKvebdrQkX45W+rEjBSDXiSTx3RlF2GeqU0rtI
         wQjMuRTgrIdw011Iu7lDmiH8PdwM6AmERaZFtBculWMGkwQRI3fjD4Mc/G1A87aAnulF
         k5uXgGEEIr+YS6zt3fGL8JvTdjJP4T8akUafDoSPhIBGKvg9+1nWXlSpt/o4KpS0JXUW
         mjmIrzeho6o+hIO6meIsBCqwjemSN2tR/Dgu0GE3+HVlhn2WgJsTVzhnh9KCdgKjb5XQ
         kHmfFkrrV9gp2s1erJxtkPCjJ2ynlpFzgRr921LeCxY4hZmj6qTmeq9OcauG3hRF6SC+
         Thvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591474; x=1782196274;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0Of9ksFHOeniwctOY3Y/jVyNTeMb/iuOKQ516kZ6c8=;
        b=tI+sSFFGxjp2762HguF4n4fkVbyFt+OzDHHXCNcjOmhn3GtOkOiZyIFXnRELILtndL
         fMaWqbO89jAdH4gmkjErYcjEspgrtHiL5bwbrvTicYbs3hJvvv6lPEGHRM7TTV+Qv5Cv
         QHVuyOwbpk6eegZKtPkpGdhgVJ4g1Qulcus7yGrX4bF6zb0fmKKlo/rm2IcPGyaoAx0d
         RSWTpj96NkzviJ2dFR0ewRNe+xmlqdiAZGGpIcsj+Kt+E2LGS9pk8GemRoQ4hfNIcase
         XZ+h3NLOhU+4jNwlCA6+delQrznAeFOo2oJQRS4/+jPFrFdhCot1dhUSM4VWmj69/npI
         wq3Q==
X-Gm-Message-State: AOJu0YwJs9s7e8ckOK0wsO1LH4Vw66BBLRs6FkL9PmdHnF9ox+wQ118i
	eSnsNM4obqEjw/uySPiNIfKpeex7OYONCpsh2Qwy/iypdw60uF4v6fq+lOI4hnbxVENZJvrQqcS
	iP51szuRsRrHVpvd6TYPyrrSW/BNffbYIar/saYdFwQlwmJjsyZW9SrSSM9MGSoXo05C8x1k=
X-Gm-Gg: Acq92OHR92iOCdbozJEa2cC40sO0m+MJmHvLPeWgN+OAMPJDxsFoKr/m8tTF4Dql48j
	2KCWPavPN6UabzMNvtGMNat+ImIhcOEbAd4gbJhopSmexbVsewKDWcEv4xmFIMkH+YGCrBQpjJ5
	56ewWADqkLH2ZpfLkcOYo0IbQe5YGQ+Qq0Gve/Dm4RxC0FtBllQuINWttwJ2aKtcESdXu/5Wujj
	O1qtx/YJZb7KWK61g/LUmVRV0Z3vVpwuU+haSIe52uWsB3cOXOj/zmNfKiteAB7mGCWuOvFlkjU
	qt8fca7ARYMXgfTmH6xBE//nH1yUuQcjA+bBNE6SPBSRiY5V13dwhVRB+syjlIUs7yTOYHpoY1Q
	mpe4rUPI2EL5TfGQSyexvJMoEGgO2APOZxBG/HNZrpJdlGuPcPsA=
X-Received: by 2002:a05:6a21:174b:b0:3b4:8f2c:6805 with SMTP id adf61e73a8af0-3b7e4a39779mr2799888637.42.1781591473962;
        Mon, 15 Jun 2026 23:31:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:174b:b0:3b4:8f2c:6805 with SMTP id adf61e73a8af0-3b7e4a39779mr2799846637.42.1781591473422;
        Mon, 15 Jun 2026 23:31:13 -0700 (PDT)
Received: from [10.216.29.144] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5e509sm10645531a12.3.2026.06.15.23.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:31:13 -0700 (PDT)
Message-ID: <ea1d1eb6-4a4e-43e9-87db-917e0b94433b@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for qcs615 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lnHbAw_v77i9hFBSdoVDVBbTF1DEXxyQ
X-Proofpoint-GUID: lnHbAw_v77i9hFBSdoVDVBbTF1DEXxyQ
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a30edb2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MSBTYWx0ZWRfX6VcQcJfyFRFn
 STeqxdvUZ3wo/ncNvaqsUB+xCi95dEMPt8BDyMP4MvqnmAuftKHvflMBYD+9HWHAsAt+KEKonvi
 S1n5SYacd1h7GynpYrrohtc8ryszHN0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MSBTYWx0ZWRfX0hU7mJhlnDB6
 KtwRikZvTV91rYVbs3PWVOvSsPm6mvSMXonzmzZvPLTi1uBUuGWw5Saq0MHRHpF34wsa5/VulGY
 1k9QCjVzqpKsfhVs1bGL7gJszezIVV/SIs04NEI4tJFQYD6bTZat4bAStDWI+DN+8SjcWE4Hr6a
 Ouh4FRWhtTI6tA4rQHKRA3SZ6nXO1U0c1gjLnpmu/NnmE53UAyT2r4Pf/DJPcckVs7SiI6ZKrHM
 9jcE1JS5bQqXz0++S/wJUd91IE900MnRKxpmCYDAXYNjemIrG2/Gn8G4sBMDvU3Os6LWALv/4Bs
 4w/PUeN9YUAWpG79Rrhq1m0ZyWdaIP5UiiEDXhOV3zgDHASzk6X95bN/QuFajtkQz/krqX449Sg
 ZSAzlzxdxEUMQlhcQVIY2Iw7lTrk5c/yL8Cc6UMrGK7Io8zfzT0S2Wz3Hdo/YNmf0WT3QOSkg7Y
 jlqfA56lerWD66zh1pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160061

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-talos

for you to fetch changes up to 8db1d808f968e7bf3810667095fa36d8f2766d81:

   qcom: update ADSP firmware for qcs615 platform (2026-06-16 11:48:24 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP firmware for qcs615 platform

  WHENCE               |   2 +-
  qcom/qcs615/adsp.mbn | Bin 8536204 -> 8532108 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
